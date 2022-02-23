import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { CardReaderView } from 'react-native-card-reader';

export default function App() {
  return (
    <View style={styles.container}>
      <CardReaderView color="#ffffff" style={styles.box} onNumberDetected={e => { console.log(e.nativeEvent.nativeNumber) }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: '100%',
    height: '100%',
    marginVertical: 20,
  },
});
