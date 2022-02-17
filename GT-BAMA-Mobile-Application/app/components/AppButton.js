import React from 'react'
import { StyleSheet, Text, TouchableOpacity } from 'react-native'

export default function AppButton({title, onPress}) {
    return (
        <TouchableOpacity style={styles.button} onPress={onPress}>
            <Text style={styles.text}>{title}</Text>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    button:{
        backgroundColor: "grey",
        borderRadius: 25,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 15,
        width: '100%'
    },
    text:{
        color: 'white',
        fontSize: 18,
        fontWeight: 'bold'
    }
})
