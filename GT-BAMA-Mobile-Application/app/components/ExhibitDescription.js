import React from 'react'
import { StyleSheet, Text, SafeAreaView } from 'react-native'

export default function ExhibitDescription({description}) {
    return (
       <SafeAreaView>
            <Text style={{color: "white", fontSize: 20, margin: 25, textAlign: "center"}}>{description}</Text>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    
})
