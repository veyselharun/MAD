import FontAwesome from '@expo/vector-icons/FontAwesome';
import { useEffect, useState } from 'react';
import { ActivityIndicator, FlatList, StyleSheet, Text, View } from 'react-native';

type Todo = {
  userId: number;
  id: number;
  title: string;
  completed: boolean;
};

export default function TodoList() {
  const [isLoading, setLoading] = useState(true);
  const [todos, setTodos] = useState<Todo[]>([]);

  useEffect(() => {
    fetchTodoList();
  }, []);

  const fetchTodoList = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/todos/');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const json = await response.json();
      setTodos(json);
      console.log('Todo List:', json);
    } catch (error) {
      console.error('Error fetching todos:', error);
    } finally {
      setLoading(false);
    }
  };

  const renderTodoItem = ({ item }: { item: Todo }) => (
    <View style={styles.itemContainer}>
      <FontAwesome
        name={item.completed ? 'check-square' : 'square-o'}
        size={20}
        color={item.completed ? '#4CAF50' : '#757575'}
        style={styles.checkbox}
      />
      <Text style={[styles.title, item.completed && styles.completedTitle]}>
        {item.title}
      </Text>
    </View>
  );

  const renderSeparator = () => <View style={styles.separator} />;

  return (
    <View style={styles.container}>
      {isLoading ? (
        <ActivityIndicator size="large" color="#2f95dc" />
      ) : (
        <FlatList
          data={todos}
          keyExtractor={(item) => item.id.toString()}
          renderItem={renderTodoItem}
          ItemSeparatorComponent={renderSeparator}
          contentContainerStyle={styles.listContainer}
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    paddingHorizontal: 16,
  },
  listContainer: {
    paddingVertical: 16,
  },
  itemContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 12,
  },
  checkbox: {
    marginRight: 12,
  },
  title: {
    fontSize: 16,
    color: '#333',
    flex: 1,
  },
  completedTitle: {
    color: '#757575',
    textDecorationLine: 'line-through',
  },
  separator: {
    height: 1,
    backgroundColor: '#e0e0e0',
  },
});