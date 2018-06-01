import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import TodoList from './TodoListComponent';

const todoItems = [
  { key: '0', title: "Create first todo", isCompleted: true },
  { key: '1', title: "Climb a mountain", isCompleted: false },
  { key: '2', title: "Create React Native blog post", isCompleted: false },
 ];
export default class App extends React.Component {
  render() {
    return (
      <TodoList todoItems={todoItems} />
    );
  }
}