import React, {useState, useEffect, useRef, useReducer} from 'react'
import { FlatList, StyleSheet, Text, View } from 'react-native'

import ActivityIndicator from "../components/ActivityIndicator";

import Card from '../components/Card';
import AppButton from "../components/AppButton";
import Screen from '../components/Screen'
import exhibitsApi from "../api/exhibits";
import beaconsApi from '../api/beacons';
import useApi from "../hooks/useApi";
import routes from '../navigation/routes';
import { BleManager } from "react-native-ble-plx";

const manager = new BleManager();

export default function ExhibitsScreen({navigation: {navigate}, route}) {
    var getBeaconsApi = useApi(beaconsApi.getBeacons);
    var beacons = getBeaconsApi.data;
    var newScanned = [];
    var scannedItems = [];
    var getExhibitsApi = useApi(exhibitsApi.getExhibits);
    const exhibits = getExhibitsApi.data;
    var filteredExhibits = exhibits.filter(m => m.museumId === route.params.museumId);
    const [actualExhibits, setExhibits] = useState([]);
    

    useEffect(() => {
        getExhibitsApi.request();
        getBeaconsApi.request(); 
    }, []);

    const scanAndConnect = async() => {
        manager.startDeviceScan(null, null, (error, device) => {
            scannedItems.push(device);
        });
        setTimeout(() => {
            manager.stopDeviceScan();

            scannedItems.forEach(element => {
                beacons.forEach(b => {
                    if(element.name === b.bluetoothName){
                        b = ({...b, [b.rssi]: element.rssi});
                        newScanned.push(b);
                    }
                });
            });
            newScanned = newScanned.filter((v,i,a)=>a.findIndex(t=>(t.id === v.id))===i);

            // newScanned.forEach(element => {
            //     console.log(element);
            // });
        }, 2000);
    }

    useEffect(() => {
        getExhibitsAgain();
    }, [actualExhibits]);

    const getExhibitsAgain = async() => {
        await scanAndConnect();
        var actualExhibits = [];
        setTimeout(() => { 
            filteredExhibits.forEach(element => {
            newScanned.forEach(e => {
                if(element.id === e.exhibitId){
                    element = ({...element, [element.rssi]: e.undefined});
                    actualExhibits.push(element);
                    }
                });
            });
            actualExhibits.sort((a, b) => (b.undefined > a.undefined) ? 1 : -1)
            actualExhibits = actualExhibits.filter((v,i,a)=>a.findIndex(t=>(t.id === v.id))===i);
            setExhibits(actualExhibits);
        }, 2500);
    }
    
  
    return (
        <Screen style={styles.screen}>
            {getExhibitsApi.error && (
        <>
          <Text>Couldn't retrieve the exhibits.</Text>
          <AppButton title="Retry" onPress={getExhibitsApi.request} />
        </>
      )}
            <ActivityIndicator visible={getExhibitsApi.loading} />
            <FlatList
                data={actualExhibits}
                keyExtractor={(item) => item.id.toString()}
                renderItem={({item}) => (
                    <Card
                        title={item.name}
                        imageUrl={item.pictureLink}
                        onPress={() => 
                            navigate(routes.MEDIA_PAGE, {
                                exhibit: item,
                            })
                        }
                    />
                )}
            />
        </Screen>
    )
}

const styles = StyleSheet.create({
    screen:{
        padding: 20,
        backgroundColor: "#333333"
    }
})