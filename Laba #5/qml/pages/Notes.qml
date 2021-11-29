import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Dao { id: dao }

    Column {
        id: myColumn
        width: page.width
        spacing: 10

        PageHeader {
            title: "Задание 6";
            description: "Заметки"
        }

        TextField {
            id: txtfield
            width: parent.width
            focus: true
        }

        Button {
            id: createButton
            text: "Добавить заметку"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                dao.insertBook(txtfield.text)
                selectBooks()
            }
        }

        SilicaListView {
            height: parent.height
            width: parent.width
            model: ListModel { id: booksListModel }
            delegate: ListItem {
                onClicked: {
                    deleteNote(index)
                }

                Label {
                    text: title
                }
            }
        }
    }

    function selectBooks() {
        booksListModel.clear();
        dao.retrieveBooks(function(books) {
            for(var i=0; i<books.length;i++) {
                var book = books.item(i);
                booksListModel.append({id:book.id, title: book.title});
            }
        });
    }

    function deleteNote(index) {
        booksListModel.clear();
        dao.retrieveBooks(function(books) {
            var book = books.item(index);
            dao.deleteBook(book.id);
            selectBooks();
        });
    }

    Component.onCompleted: selectBooks()
}

