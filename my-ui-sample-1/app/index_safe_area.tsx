import { StyleSheet, Text, View } from 'react-native';
//import { SafeAreaView } from 'react-native-safe-area-context';


export default function OverLappingScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.topText}>This is the sample text.</Text>
    </View>
  );
}


/*
export default function NonOverLappingScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.topText}>This is the sample text.</Text>
    </SafeAreaView>
  );
}
*/

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    paddingTop: 0,
  },
  topText: {
    fontSize: 20,
  },
});
