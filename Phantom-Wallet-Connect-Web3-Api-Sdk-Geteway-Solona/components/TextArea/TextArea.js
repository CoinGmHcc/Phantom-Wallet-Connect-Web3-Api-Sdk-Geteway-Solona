import React, {Component} from 'react';
import {TextInput, StyleSheet} from 'react-native';

const TextArea = (props) => {
    return (
        <TextInput 
            {...props}
            style={[style.textArea, {...props.style}]}
            multiline={true}
            numberOfLines={4}            
        />
    )
};

const style = StyleSheet.create({
    textArea: {
        borderWidth: 0.5,
        borderColor: 'gray'
    }
});

export default TextArea;

