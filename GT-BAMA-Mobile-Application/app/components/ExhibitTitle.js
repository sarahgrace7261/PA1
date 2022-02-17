import React from 'react'
import { StyleSheet, Text, SafeAreaView } from 'react-native'

export default function ExhibitTitle({title}) {
    return (
       <SafeAreaView>
            <Text style={{color: "white", fontSize: 30, margin: 25, textAlign: "center"}}>{title}</Text>
        </SafeAreaView> 
    );
}

const styles = StyleSheet.create({
    
})
