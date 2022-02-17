import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import {NavigationContainer} from "@react-navigation/native";
import WelcomeScreen from "./app/screens/WelcomeScreen";
import MuseumsScreen from './app/screens/MuseumsScreen';
import ExhibitsScreen from './app/screens/ExhibitsScreen';
import ExhibitMediaScreen from './app/screens/ExhibitMediaScreen';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{headerStyle:{backgroundColor: "#333333"}, headerTintColor: 'white', headerTitleStyle: {color: 'white'}}}>
        <Stack.Screen name="Welcome" component={WelcomeScreen} />
        <Stack.Screen name="Museums" component={MuseumsScreen} />
        <Stack.Screen name="Exhibits" component={ExhibitsScreen} />
        <Stack.Screen name="MediaPage" component={ExhibitMediaScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  }
});