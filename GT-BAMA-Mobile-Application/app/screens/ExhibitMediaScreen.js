import React from "react";
import { StyleSheet, View, SafeAreaView, Text, ScrollView } from "react-native";
import { WebView } from "react-native-webview";
import YoutubePlayer from "react-native-youtube-iframe";
import routes from "../navigation/routes";
import ExhibitTitle from "../components/ExhibitTitle";
import ExhibitDescription from "../components/ExhibitDescription";
import AppButton from "../components/AppButton";

import { Audio } from "expo-av";
import VideoPlayer from "../components/VideoPlayer";

export default function ExhibitMediaScreen({ route }) {
  const [sound, setSound] = React.useState();

  const Separator = () => <View style={styles.separator} />;

  async function playSound(audio) {
    const { sound } = await Audio.Sound.createAsync({
      uri: audio,
    });
    setSound(sound);
    sound.playAsync();
  }

  function handlePause() {
    sound.pauseAsync();
  }

  React.useEffect(() => {
    return sound
      ? () => {
          sound.unloadAsync();
        }
      : undefined;
  }, [sound]);

  return (
    <View style={styles.screen}>
    <ScrollView>
    <SafeAreaView style={styles.screen}>
      {/* need text to be formatted like a title - create new component */}
      <ExhibitTitle title={route.params.exhibit.name}></ExhibitTitle>
      {/* need to format this with new componenet too maybe on api side */}
      <ExhibitDescription
        description={route.params.exhibit.exhibitDescription}
      ></ExhibitDescription>
      <Separator />
      {/* commenting out the YouTube player bc it only works with the id */}
      {/* <YoutubePlayer
                height={300}
                play={false}
                videoId={route.params.exhibit.mediaLink === 'null' ? 'XVURdhqWNPs' : route.params.exhibit.mediaLink}
            /> */}
      {(route.params.exhibit.mediaLink).includes('.mp4') ?
                <VideoPlayer link={route.params.exhibit.mediaLink}/>
                :
                <YoutubePlayer
                height={300}
                play={false}
                videoId={route.params.exhibit.mediaLink === 'null' ? 'yYzBEL58nZ8' : route.params.exhibit.mediaLink}
                />
            }
      <Separator />
      <Text
        style={{
          color: "white",
          fontSize: 22,
          margin: 10,
          textAlign: "center",
        }}
      >
        Exhibit Audio
      </Text>
      <View style={styles.buttonContainer}>
        <AppButton 
            title="Play" 
            onPress={() => playSound(route.params.exhibit.audioLink)} 
        />
        <Text></Text>
        <AppButton 
            title="Stop" 
            onPress={handlePause} 
        />
      </View>
    </SafeAreaView>
    </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  screen: {
    backgroundColor: "#333333",
    flex: 1,
  },
  buttonContainer: {
    width: "100%",
    padding: 20,
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: "#737373",
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});
