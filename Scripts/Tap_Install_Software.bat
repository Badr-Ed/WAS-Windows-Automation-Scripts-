import tkinter as tk
from tkinter import messagebox

class AppInstaller:
    def __init__(self, master):
        self.master = master
        self.master.title("App Installer")

        self.applications = {
            "Zoom": "https://download.zoom.us/client/latest/ZoomInstaller.exe",
            "Google Chrome": "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi",
            "Skype": "https://go.skype.com/windows.desktop.download",
        }

        self.create_ui()

    def create_ui(self):
        for app_name in self.applications:
            button = tk.Button(self.master, text=app_name, command=lambda name=app_name: self.install_app(name))
            button.pack(pady=5)

    def install_app(self, app_name):
        # Here, you would typically initiate the download and installation process
        # using the respective platform's APIs or package management system.
        # For simplicity, we'll display a message box indicating the installation action.

        messagebox.showinfo("Installation", f"Installing {app_name}...")

# Create the main window
root = tk.Tk()

# Create an instance of the AppInstaller class
app_installer = AppInstaller(root)

# Start the Tkinter event loop
root.mainloop()
