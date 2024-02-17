import sys
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
from PyQt5.QtWebEngineWidgets import *

class CookieDialog(QDialog):
    def __init__(self, cookies, parent=None):
        super(CookieDialog, self).__init__(parent)
        self.setWindowTitle('Cookies')
        self.setFixedSize(400, 300)

        layout = QVBoxLayout(self)

        cookie_text = QTextBrowser(self)
        cookie_text.setPlainText(cookies)
        layout.addWidget(cookie_text)

        close_button = QPushButton('Close', self)
        close_button.clicked.connect(self.accept)
        layout.addWidget(close_button)

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()

        # Create the browser view
        self.browser = QWebEngineView()
        self.browser.setUrl(QUrl('http://google.com'))
        self.setCentralWidget(self.browser)
        self.showMaximized()

        # Create the navigation bar
        self.create_navigation_bar()

        # Create the extension bar
        self.create_extension_bar()

        # Variable to track online/offline status
        self.online_mode = True

    def create_navigation_bar(self):
        navbar = QToolBar()
        self.addToolBar(navbar)

        back_btn = QAction('Back', self)
        back_btn.triggered.connect(self.browser.back)
        navbar.addAction(back_btn)

        forward_btn = QAction('Forward', self)
        forward_btn.triggered.connect(self.browser.forward)
        navbar.addAction(forward_btn)

        reload_btn = QAction('Reload', self)
        reload_btn.triggered.connect(self.browser.reload)
        navbar.addAction(reload_btn)

        home_btn = QAction('Home', self)
        home_btn.triggered.connect(self.navigate_home)
        navbar.addAction(home_btn)

        cookie_btn = QAction('Show Cookies', self)
        cookie_btn.triggered.connect(self.show_cookies)
        navbar.addAction(cookie_btn)

        # Toggle button for offline/online mode
        online_toggle_btn = QAction('Offline/Online', self)
        online_toggle_btn.setCheckable(True)

        # Ensure that self.online_mode is declared before using it
        self.online_mode = True
        online_toggle_btn.setChecked(self.online_mode)
        online_toggle_btn.toggled.connect(self.toggle_online_mode)
        navbar.addAction(online_toggle_btn)

        self.url_bar = QLineEdit()
        self.url_bar.returnPressed.connect(self.navigate_to_url)
        navbar.addWidget(self.url_bar)

        self.browser.urlChanged.connect(self.update_url)

    def create_extension_bar(self):
        extension_bar = QToolBar()
        self.addToolBar(extension_bar)

        highlighter_checkbox = QCheckBox('Highlight Dark Patterns')
        highlighter_checkbox.stateChanged.connect(self.toggle_highlighter)
        extension_bar.addWidget(highlighter_checkbox)

    def toggle_online_mode(self, checked):
        self.online_mode = checked
        if checked:
            # Switch to global extension
            self.remove_content_script('highlighter_local.js')
            self.load_content_script('highlighter_global.js')
        else:
            # Switch to local extension
            self.remove_content_script('highlighter_global.js')
            self.load_content_script('highlighter_local.js')

    def navigate_home(self):
        self.browser.setUrl(QUrl('http://google.com'))

    def navigate_to_url(self):
        url = self.url_bar.text()
        self.browser.setUrl(QUrl(url))

    def update_url(self, q):
        self.url_bar.setText(q.toString())

    def toggle_highlighter(self, state):
        script_name = 'highlighter_local.js' if self.online_mode else 'highlighter_global.js'
        if state == Qt.Checked:
            # Load the content script into the current web page
            self.load_content_script(script_name)
        else:
            # Remove the content script from the current web page
            self.remove_content_script(script_name)

    def load_content_script(self, script_file):
        # Read the content of the script file
        with open(script_file, 'r') as file:
            script_content = file.read()

        # Create a script object
        script = QWebEngineScript()
        script.setSourceCode(script_content)
        script.setWorldId(QWebEngineScript.MainWorld)
        script.setInjectionPoint(QWebEngineScript.DocumentCreation)

        # Add the script to the page
        self.browser.page().scripts().insert(script)

    def remove_content_script(self, script_file):
        # Find and remove the script from the page
        scripts = self.browser.page().scripts()
        for script in scripts:
            if script.sourceCode() == script_file:
                scripts.remove(script)

    def show_cookies(self):
        # Get the cookies for the current web page
        cookies = self.browser.page().profile().cookieStore().getAllCookies()
        cookie_text = "\n".join([f"{cookie.name()}: {cookie.value()}" for cookie in cookies])

        # Create and show the dialog with cookies
        dialog = CookieDialog(cookie_text, self)
        dialog.exec_()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    QApplication.setApplicationName('My Cool Browser')
    window = MainWindow()
    app.exec_()
