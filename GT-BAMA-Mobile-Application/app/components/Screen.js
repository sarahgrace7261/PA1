import React from 'react'
import Constants from "expo-constants"
import { StyleSheet, View, SafeAreaView } from 'react-native'

export default function Screen({children, style}) {
    return (
        <SafeAreaView style={styles.screen}>
            <View style={style}>{children}</View>
        </SafeAreaView>
    )
}

const styles = StyleSheet.create({
    screen:{
        paddingTop: Constants.statusBarHeight,
        flex: 1,
        backgroundColor: "#333333"
    },
})
