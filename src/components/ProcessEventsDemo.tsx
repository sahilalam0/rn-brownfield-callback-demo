import React, { useState } from 'react';
import {
  TouchableOpacity,
  StyleSheet,
  Alert,
  ActivityIndicator,
  View,
  Text,
} from 'react-native';
import NativeCommunication from '../specs/NativeCommunication';

const ProcessEventsDemo: React.FC = () => {
  const [result, setResult] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(false);

  const handleProcessEvents = async () => {
    try {
      setLoading(true);
      const randomString = await NativeCommunication.processEvents();
      setResult(randomString);
    } catch (error) {
      console.error('Error calling processEvents:', error);
      Alert.alert('Error', 'Failed to process events');
    } finally {
      setLoading(false);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Process Events Demo</Text>

      <TouchableOpacity
        style={[styles.button, loading && styles.buttonDisabled]}
        onPress={handleProcessEvents}
        disabled={loading}
      >
        {loading ? (
          <ActivityIndicator color="#FFFFFF" />
        ) : (
          <Text style={styles.buttonText}>Generate Random String</Text>
        )}
      </TouchableOpacity>

      {result ? (
        <View style={styles.resultContainer}>
          <Text style={styles.resultLabel}>Latest Result:</Text>
          <Text style={styles.resultText}>{result}</Text>
        </View>
      ) : (
        <Text style={styles.placeholder}>
          Click the button to generate a random string from native iOS
        </Text>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 40,
    color: '#333',
  },
  button: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 30,
    paddingVertical: 15,
    borderRadius: 10,
    marginBottom: 30,
    minWidth: 200,
    alignItems: 'center',
  },
  buttonDisabled: {
    backgroundColor: '#999',
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  resultContainer: {
    backgroundColor: '#FFFFFF',
    padding: 20,
    borderRadius: 10,
    width: '100%',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.1,
    shadowRadius: 3.84,
    elevation: 5,
  },
  resultLabel: {
    fontSize: 16,
    fontWeight: '600',
    color: '#666',
    marginBottom: 10,
  },
  resultText: {
    fontSize: 18,
    color: '#333',
    fontFamily: 'Courier',
    backgroundColor: '#f8f8f8',
    padding: 10,
    borderRadius: 5,
  },
  placeholder: {
    fontSize: 16,
    color: '#999',
    textAlign: 'center',
    fontStyle: 'italic',
  },
});

export default ProcessEventsDemo;
