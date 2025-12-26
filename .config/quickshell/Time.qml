import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: root
  property string time

  Variants{
    model: Quickshell.screens


      PanelWindow {
        required property var modelData
        screen: modelData
        
        anchors {
          top: true
          left: true
          right: true
        }
        implicitHeight: 30

        Text {
          anchors.centerIn: parent
          text: root.time
        }
      }

  }
  Process {
    id: dateProc
    command: ["date"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.text = this.text 
    }
  }
//infinate 1 second loop
  Timer { 
    interval: 1000 // 1k millisecond
    running: true 
    repeat: true 
    onTriggered: dateProc.running = true //when triggered, date updates
  }
}

