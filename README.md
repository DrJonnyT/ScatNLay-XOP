## ScatNLay
ScatNLay Igor Extension for Mie scattering/absorption
 
**Overview**  
The ScatNLay Igor Extension is the implementation of ScattNLay (with two T's) Mie code into Igor Pro. The original ScattNLay is Mie code in C (available [here](https://scattport.org/index.php/programs-menu/mie-type-codes-menu/390-scattnlay)) and described in [the paper by Pena and Pal](https://www.sciencedirect.com/science/article/pii/S0010465509002306).

**Installation instructions**  
Place the ScatNLay.xop in your 32-bit Igor extensions folder
C:\Program Files\WaveMetrics\Igor Pro 7 Folder\Igor Extensions\ or equivalent folder.
Please note it only runs for the 32-bit version of Igor, so you will have to run the 32-bit executable from C:\Program Files\WaveMetrics\Igor Pro 7 Folder\IgorBinaries_Win32\Igor.exe . **It will not work using 64-bit Igor**.

**How to use ScatNLay**  
Once installed, you will have a function for ScatNLay within Igor:  
scatnlay(num_layers,ri_wave,size_wave,num_theta,theta_start,theta_end)  
num_layers is the number of layers (1 for a homogeneous sphere, 2 for core/shell)  
ri_wave is a complex wave containing the real and imaginary components of the refractive index of the different layers  
size_wave is a normal wave containing the size parameters (πD/λ) of the different layers  
num_theta, theta_start and theta_end refer to the number and range of angles over which you want to calculate the scattering  
Example functions are provided in ScatNLay_Basic_Procedures.ipf and these should be useful  

**Outputs** (explained in detail in the paper by Pena and Pal linked above)  
V_Qsca : Scattering efficiency  
V_Qabs : Absorption efficiency  
V_Qext : Extinction efficiency  
V_Qbk : Radar backscattering efficiency factor  
V_Alb : Single scatter albedo  
V_g : Asymmetry parameter  
V_pr : radiation pressure efficiency factor  

**Known bugs**  
The XOP will crash Igor if you try to run it with something too outlandish, so a particle with a size parameter that is too large, or too many layers, or too high a refractive index







