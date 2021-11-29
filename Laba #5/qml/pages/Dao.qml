import QtQuick.LocalStorage 2.0
import QtQuick 2.0

Item {
    property var db
    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("books1", "1.0")
        createBooksTable()
    }

    function createBooksTable() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS books1(id INTEGER PRIMARY KEY AUTOINCREMENT,"
                          + "title TEXT NOT NULL);")
        })
    }

    function deleteBook(id) {
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM books1 WHERE id = ?;", [id])
        })
    }

    function retrieveBooks(callback) {
        db.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM books1;")
            callback(result.rows)
        })
    }

    function insertBook(title) {
        db.transaction(function(tx) {
            var result = tx.executeSql("INSERT INTO books1 (title) VALUES(?);",[title])
        })
    }
}

