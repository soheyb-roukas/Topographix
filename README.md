# Topographix  

![Topographix Interface](https://raw.githubusercontent.com/soheyb-roukas/Topographix/refs/heads/main/icons8_coordinate_system_150px.png)  
*An alternative to traditional tools like AutoCAD + Covadis for topographic professionals.*

**Topographix** is a modern, streamlined alternative to traditional tools like AutoCAD and Covadis, designed specifically for professionals in topography and public works. This Windows desktop application simplifies the process of matching topographic coordinates with their nearest axis profiles, calculating distances, and organizing results in an easy-to-read ordered list.

## Key Features:
- **Coordinate Matching**: Quickly match topographic coordinates (`x`, `y`, `z`) with their corresponding axis profiles.
- **Distance Calculation**: Accurately compute the distance of each point to the nearest axis.
- **Organized Outputs**: Results are provided in a structured, ordered list for seamless data review.
- **User-Friendly Interface**: Designed with topographic and public works professionals in mind for ease of use.
- **Enhanced Productivity**: Eliminates the need for complex workflows in older tools like AutoCAD + Covadis, saving time and effort.

## Target Users:
- **Topographic Professionals**: Streamline topographic data processing and visualization.
- **Public Works Engineers**: Simplify data alignment and distance calculations for projects.

## Technologies:
- **Language**: Pascal (Delphi)  
- **Framework**: VCL (Visual Component Library)  
- **Platform**: Windows (32-bit and 64-bit)  

## Getting Started:
1. Clone the repository:  
   git clone https://github.com/soheyb-roukas/topographix.git
2. Open the project in your Delphi IDE.
3. Build and run the application to get started.

## Common Issue: Decimal Character Settings  

**Problem**: Some users may encounter errors when running the application because their Windows system uses `;` (semicolon) instead of `.` (period) as the decimal separator. This can affect how numerical data is processed.  

**Solution**:  
1. Open the **Control Panel** in Windows.  
2. Go to **Clock and Region** > **Region** (or search for "Region Settings").  
3. In the **Formats** tab, click on **Additional Settings**.  
4. Under the **Numbers** section, find the **Decimal symbol** field.  
5. Change the decimal symbol from `;` (semicolon) to `.` (period).  
6. Click **Apply** and restart the application.  

This adjustment ensures that the application processes numerical data correctly.  

## Screenshot:
![Topographix Interface](https://i.ibb.co/YQsgKMf/Image1.png)  
*Example of the user-friendly interface for topographic professionals.*

## Common Issue: Decimal Character Settings  

**Problem**: Some users may encounter errors when running the application because their Windows system uses `;` (semicolon) instead of `.` (period) as the decimal separator. This can affect how numerical data is processed.  

**Solution**:  
1. Open the **Control Panel** in Windows.  
2. Go to **Clock and Region** > **Region** (or search for "Region Settings").  
3. In the **Formats** tab, click on **Additional Settings**.  
4. Under the **Numbers** section, find the **Decimal symbol** field.  
5. Change the decimal symbol from `;` (semicolon) to `.` (period).  
6. Click **Apply** and restart the application.  

This adjustment ensures that the application processes numerical data correctly.

**Solution 2**:  
replace all the `.` (period) with `;` (semicolon) in your files.


## Contributing:
Contributions are welcome! Please submit a pull request or create an issue to discuss any changes or improvements.
