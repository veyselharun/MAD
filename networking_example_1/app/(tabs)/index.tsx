import { Button, StyleSheet, View } from 'react-native';

export default function Index() {

  const getTODO1 = () => {
    fetch('https://jsonplaceholder.typicode.com/todos/1')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(json => {
        console.log('TODO 1:', json);
      })
      .catch(error => {
        console.error('Error fetching TODO:', error);
        throw error;
      });
  };

  const getTODO2 = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/todos/1');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const json = await response.json();
      console.log('TODO 2:', json);
    } catch (error) {
      console.error('Error fetching TODO:', error);
      throw error;
    }
  };

  return (
    <View style={styles.container}>
      <Button title="Fetch TODO" onPress={getTODO2} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
});