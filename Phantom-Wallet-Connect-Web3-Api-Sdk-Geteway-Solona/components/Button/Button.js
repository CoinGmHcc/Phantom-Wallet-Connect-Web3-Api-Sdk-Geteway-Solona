import React, {Component} from 'react';
import {TouchableOpacity, Text, StyleSheet} from 'react-native';

const Button = (props) => {
    return(
        <TouchableOpacity {...props} style={[styles.button, {...props.style}]}>
            <Text style={styles.title}>{props.title === undefined ? '' : props.title}</Text>
        </TouchableOpacity>
    )
};

const styles = StyleSheet.create({
    button: {
        height: 40,
        backgroundColor: '#444444',
        borderRadius: 8,
        alignItems: 'center',    
        justifyContent: 'center',    
        shadowColor: 'gray',
        shadowRadius: 8,
        shadowOpacity: 0.5,
        shadowOffset:{  width: 4,  height: 4,  }
    },
    title: {
        color: 'white',
        fontWeight: 'bold',
        fontSize: 14,
        textAlignVertical: 'center'
    }
});

export default Button;
