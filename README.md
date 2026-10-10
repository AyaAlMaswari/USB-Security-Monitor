# USB Security Monitor

## IoT-Based USB Security Monitoring System

**Al-Razi University**  
**Course:** Internet of Things (IoT)  
**Academic Level:** Level 4 - Semester 1 (2026)  
**Supervisor:** Eng. Majd Al-Suraihi

---

## 1. Project Overview

USB Security Monitor is an IoT-based cybersecurity project designed to detect, identify, and monitor USB storage devices connected to a computer.

The system uses an ESP32 microcontroller, Windows PowerShell, and a graphical user interface (GUI) to monitor USB connections and provide real-time security alerts.

It distinguishes between registered and unregistered USB storage devices using a trusted-device list.

## 2. Problem Statement

USB flash drives are commonly used for transferring data between computers.

However, connecting unknown USB devices may introduce security risks, including malware infections and unauthorized data access.

This project provides a monitoring and alerting system that helps users identify unregistered USB storage devices.

## 3. Project Objectives

- Detect newly connected USB storage devices.
- Identify registered and unregistered USB devices.
- Display real-time security notifications.
- Activate green and red LEDs using ESP32.
- Generate alerts for unregistered USB devices.
- Record USB connection events.
- Provide a user-friendly monitoring interface.

## 4. Hardware Components

- ESP32 Development Board
- Breadboard
- Green LED
- Red LED
- Resistors
- Jumper Wires
- USB Cable
- USB Flash Drives
- Laptop

## 5. Software Components

- Arduino IDE
- Windows PowerShell
- Windows 10
- PowerShell GUI
- USB Device Monitoring Script

## 6. System Operation

### Registered USB Device

When a registered USB storage device is connected:

1. The computer detects the USB device.
2. The monitoring software reads its device identifier.
3. The identifier is compared with the trusted-device list.
4. The system recognizes the device as registered.
5. The ESP32 activates the green LED.
6. The event is recorded in the security log.

### Unregistered USB Device

When an unregistered USB storage device is connected:

1. The computer detects the USB device.
2. The system checks its identifier.
3. The device is classified as unregistered.
4. A security warning appears in the GUI.
5. The ESP32 activates the red LED.
6. An audible notification is generated.
7. The event is recorded in the security log.

### USB Removal

When the monitored USB device is removed, the system updates its monitoring state and turns off the corresponding indicator.

## 7. Graphical User Interface

The USB Security Center GUI provides:

- Real-time USB monitoring.
- Security status notifications.
- Registered USB device counter.
- Unregistered USB device counter.
- USB connection history.
- Device identification information.
- ESP32 serial port selection.
- Monitoring start and stop controls.

## 8. Project Files

| File | Description |
|------|-------------|
| USB_Security_Monitor.ino | ESP32 Arduino source code |
| USB_Security_Monitor.ps1 | PowerShell USB monitoring script |
| USB_Security_Center_GUI_v2.zip | GUI source code and startup files |
| USB Security Monitor.pdf | Project documentation |
| README.md | Project overview and instructions |

## 9. How to Run

1. Connect the ESP32 board to the laptop.
2. Ensure the ESP32 firmware has been uploaded using Arduino IDE.
3. Download and extract the GUI ZIP file.
4. Keep the required GUI and startup files together.
5. Configure the local trusted USB device list.
6. Run START_USB_SECURITY.bat.
7. Select the correct ESP32 COM port.
8. Click Start Monitoring.
9. Insert a USB flash drive.
10. Observe the GUI notifications and LED indicators.

## 10. Testing and Results

The prototype was tested using registered and unregistered USB flash drives.

The following functions were demonstrated:

- Detection of USB storage devices.
- Identification of registered devices.
- Identification of unregistered devices.
- Green LED activation for registered devices.
- Red LED activation for unregistered devices.
- Security event logging.
- Graphical security notifications.

## 11. Current Limitations

The current prototype provides USB identification, monitoring, and security alerts.

It does not physically block USB devices, prevent file access, or perform antivirus scanning.

These capabilities may be considered for future development.

## 12. Future Improvements

- Antivirus scanning integration.
- Enhanced device registration management.
- Advanced security reporting.
- Improved graphical interface.
- Additional IoT security features.

## 13. Project Team

**Al-Razi University - Internet of Things**

| Attendance No. | Team Member |
|----------------|-------------|
| 30 | آية عبدالملك علي المسوري |
| 26 | أنوار بشير محمد الجشاعة |
| 118 | كوثر توفيق يحيى الدغار |
| 16 | اسماء محمد محسن الانسي |

**Supervisor:** Eng. Majd Al-Suraihi

---

## 14. Project Documentation

The complete academic documentation is available in:

**USB Security Monitor.pdf**

---

**USB Security Monitor | IoT & Cybersecurity Project | 2026**
