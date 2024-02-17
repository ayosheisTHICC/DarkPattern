import sys
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
from PyQt5.QtWebEngineWidgets import *

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

    def navigate_home(self):
        self.browser.setUrl(QUrl('http://google.com'))

    def navigate_to_url(self):
        url = self.url_bar.text()
        self.browser.setUrl(QUrl(url))

    def update_url(self, q):
        self.url_bar.setText(q.toString())

    def toggle_highlighter(self, state):
        if state == Qt.Checked:
            # Load the content script into the current web page
            with open('highlighter.js', 'r') as file:
                script_content = file.read()
                self.load_content_script(script_content)
        else:
            # Remove the content script from the current web page
            self.remove_content_script('highlighter.js')

    def load_content_script(self, script_content):
        # Run JavaScript code in the current page
        self.browser.page().runJavaScript(script_content)

    def remove_content_script(self, script_file):
        # Run JavaScript code to remove the injected script
        remove_script_code = f"""
            var scripts = document.getElementsByTagName('script');
            for(var i = scripts.length - 1; i >= 0; i--) {{
                if(scripts[i] && scripts[i].getAttribute('src') === '{script_file}') {{
                    scripts[i].parentNode.removeChild(scripts[i]);
                }}
            }}
        """
        self.browser.page().runJavaScript(remove_script_code)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    QApplication.setApplicationName('My Cool Browser')
    window = MainWindow()
    app.exec_()
