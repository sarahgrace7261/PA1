import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import MuseumsScreen from "../screens/MuseumsScreen";
import ExhibitsScreen from "../screens/ExhibitsScreen";

const Stack = createStackNavigator();

const FeedNavigator = () => (
  <Stack.Navigator mode="modal" screenOptions={{ headerShown: false }}>
    <Stack.Screen name="Museums" component={MuseumsScreen} />
    <Stack.Screen name="Exhibits" component={ExhibitsScreen} />
  </Stack.Navigator>
);

export default FeedNavigator;
