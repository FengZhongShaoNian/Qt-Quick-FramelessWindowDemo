import QtQuick 2.0

Item {
    id: xbutton

    property string buttonNormalImage: ""
    property string buttonPressedImage: ""
    property string buttonHoverImage: ""
    property string buttonDisableImage: ""
    property bool buttonDisable: false

    signal clicked();
    signal exited();
    signal entered();
    Image {
        id: xbuttonImage
        anchors.fill: parent
        source: buttonNormalImage
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(false == buttonDisable)
                {
                    xbutton.entered();
                    xbuttonImage.source = buttonHoverImage;
                }

            }
            onClicked: {
                if(false == buttonDisable)
                {
                    xbutton.clicked();
                    xbuttonImage.source = buttonPressedImage;
                }

            }
            onExited: {
                if(false == buttonDisable)
                {
                    xbutton.exited();
                    xbuttonImage.source = buttonNormalImage;
                }

            }
        }
    }
    onButtonDisableChanged : {
        buttonDisable === false ? (xbuttonImage.source = buttonNormalImage)
                                : (xbuttonImage.source = buttonDisableImage);
    }
}
