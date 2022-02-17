import React from 'react'
import { Image, StyleSheet, Text, TouchableWithoutFeedback, View } from 'react-native'

export default function Card({title, imageUrl, onPress}) {
    return (
        <TouchableWithoutFeedback onPress={onPress}>
            <View style={styles.card}>
                <Image style={styles.image} source={{uri: imageUrl}}/>
                <View style={styles.detailsContainer}>
                    <Text style={styles.title}>{title}</Text>
                </View>
                <Text></Text>
            </View>
        </TouchableWithoutFeedback>
    )
}

const styles = StyleSheet.create({
    card:{
        borderRadius: 15,
        backgroundColor: 'white',
        marginBottom: 20,
        overflow: 'hidden',
    },
    detailsContainer:{
        padding: 20,
    },
    image:{
        width: '100%',
        height: 200,
    },
    // subTitle:{
    //     color: 'black',
    //     fontWeight: 'bold',
    // },
    title:{
        marginBottom: 7,
    },
})
