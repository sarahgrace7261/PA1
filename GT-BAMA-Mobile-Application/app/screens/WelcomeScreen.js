import React from 'react'
import { StyleSheet, Text, View, SafeAreaView } from 'react-native'
import AppButton from '../components/AppButton'
import routes from '../navigation/routes'
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Button } from 'react-native-elements';

import "react-native-gesture-handler";
import { useNavigation } from "@react-navigation/native";
import MuseumsScreen from './MuseumsScreen';


export default function WelcomeScreen({navigation}) {
    return (
       <SafeAreaView style={styles.background}>
            <Text style={{color: "white", fontSize: 30, margin: 25, textAlign: "center"}}>Welcome to GT-BAMA (Guided Tours - Bluetooth Assisted Museum Application)</Text>
            <Text style={{color: "white", fontSize: 20, margin: 25, textAlign: "center"}}>Please turn on Bluetooth!</Text>
            <View style={styles.buttonContainer}>
                <AppButton title="Get Started" onPress={() => navigation.navigate("Museums")} ></AppButton>
            </View>
        </SafeAreaView> 

    );
}

const styles = StyleSheet.create({
    background:{
        flex: 1,
        backgroundColor: "#333333",
        justifyContent: "center",
        alignItems: 'center',
        color: "white",
    },
    buttonContainer:{
        width:'100%',
        padding: 20
    }
})
