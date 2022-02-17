import React, { useEffect } from "react";
import { FlatList, StyleSheet, Text, View } from "react-native";

import ActivityIndicator from "../components/ActivityIndicator";

import Card from "../components/Card";
import AppButton from "../components/AppButton";
import Screen from "../components/Screen";
import museumsApi from "../api/museums";
import useApi from "../hooks/useApi";
import routes from "../navigation/routes";

export default function MuseumsScreen({ navigation: { navigate } }) {
  const getMuseumsApi = useApi(museumsApi.getMuseums);

  useEffect(() => {
    getMuseumsApi.request();
  }, []);

  return (
    <Screen style={styles.screen}>
      {getMuseumsApi.error && (
        <>
          <Text>Couldn't retrieve the museums.</Text>
          <AppButton title="Retry" onPress={getMuseumsApi.request} />
        </>
      )}
      <ActivityIndicator visible={getMuseumsApi.loading} />
      <FlatList
        data={getMuseumsApi.data}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <Card
            title={item.museumName}
            imageUrl={item.pictureLink}
            onPress={() =>
              navigate(routes.EXHIBITS, {
                museumId: item.id,
              })
            } //<-- send back museum id here navigation.navigate(routes.EXHIBITS, item), setParams({museumId: item.id})
          />
        )}
      />
    </Screen>
  );
}

const styles = StyleSheet.create({
  screen: {
    padding: 20,
    //backgroundColor: '#f8f4f4'
    backgroundColor: "#333333",
  },
});
