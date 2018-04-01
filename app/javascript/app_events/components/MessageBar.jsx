import React from "react";

const WELCOME_MESSAGE = "Use the controls on the right to navigate or add a new event";
const DISPLAY_TIME = 10000;

export default class MessageBar extends React.Component {
  constructor() {
    super();
    this.state = {
      message: WELCOME_MESSAGE,
      style: ""
    };
  }

  render() {
    return (
      <div className={`message-bar ${this.state.style}`}>
        <p>{this.state.message}</p>
      </div>
    );
  }

  update(newMessage, error = false) {
    var style = "";

    if (error) {
      style = "error";
    }

    this.setState({
      message: newMessage,
      style: style
    });

    setTimeout(() => {
      this.clear();
    }, DISPLAY_TIME);
  }

  clear() {
    this.setState({
      message: "",
      style: ""
    });
  }
}
