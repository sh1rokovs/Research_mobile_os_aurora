import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page

    ConfigurationValue {
        id: setting
        key: "/apps/app_name/setting_name"
        defaultValue: "Настройка"
    }

    Column {
        width: page.width
        spacing: 10

        PageHeader {
            title: "Задание №7"
            description: "Настройки"
        }

        TextField {
            width: parent.width
            id: txtfield
        }

        Label {
            text: setting.value + " Выбрана"
        }

        Button {
            width: parent.width
            text: "Сохранить настройки"
            onClicked: setting.value = txtfield.text
        }
    }
}
