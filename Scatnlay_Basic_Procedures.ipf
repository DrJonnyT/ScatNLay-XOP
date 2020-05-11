#pragma TextEncoding = "Windows-1252"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.


//Calculates Qsca, Qabs, Qext etc for sphere
Function Homog_sphere_example(refindex_real,refindex_imag,diameter,wavelength)
variable refindex_real,refindex_imag,diameter, wavelength
make/o/n=1 size_wave = pi*diameter/wavelength	//Size parameter
if(size_wave[0] > 50) ////This is rough, to stop it from crashing Igor
	abort("quick_mie_1layer: Cannot use a size parameter that high. Aborting. Tried to use diameter of" + num2str(diameter) + " and wavelength of " + num2str(wavelength))
endif
make/o/n=(1,2) ri_wave = {{refindex_real},{refindex_imag}}
variable num_theta =360, theta_start = 0.25, theta_end = 179.75
if(scatnlay(1,ri_wave,size_wave,num_theta,theta_start,theta_end))	//Do the Mie code
		abort("In mietest2() scatNlay returned non-zero, which means there was an error.")
endif

make/o/n=(num_theta) Scattering_angle_deg = theta_start + (theta_end-theta_start)/(num_theta-1)*p
end



//Calculates Qsca, Qabs, Qext etc for 2 layered-sphere
Function CoreShell_Example(refindex_core_real,refindex_core_imag,refindex_coating_real,refindex_coating_imag,core_diameter,coated_diameter,wavelength)
variable refindex_core_real,refindex_core_imag,refindex_coating_real,refindex_coating_imag,core_diameter,coated_diameter,wavelength
make/o/n=2 size_wave = {pi*core_diameter/wavelength,pi*coated_diameter/wavelength}	//Size parameter
if(size_wave[0] > 150 || size_wave[1] > 150 )	//This is rough, to stop it from crashing Igor
	abort("quick_mie_2layer: Cannot use a size parameter that high. Aborting. Tried to use core diameter of " + num2str(core_diameter) + " and coated diameter of " + num2str(coated_diameter) + " with wavelength of " + num2str(wavelength))
endif
make/o/n=(2,2) ri_wave = {{refindex_core_real,refindex_coating_real},{refindex_core_imag,refindex_coating_imag}}
variable num_theta =360, theta_start = 0.25, theta_end = 179.75
if(scatnlay(2,ri_wave,size_wave,num_theta,theta_start,theta_end))	//Do the Mie code, abort if it fucks up
		abort("In mietest2() scatNlay returned non-zero, which means there was an error.")
endif

make/o/n=(num_theta) Scattering_angle_deg = theta_start + (theta_end-theta_start)/(num_theta-1)*p

end