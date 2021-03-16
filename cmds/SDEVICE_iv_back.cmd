File {
* Input Files
Grid  = "../structure/Loadable_fps.tdr"
* Output Files
Current = "../currents/back_iv.plt"
Plot = "../plts/back_iv"
Output  = "../logs/back_iv"
}

Electrode {
{Name="a.cont" Voltage=0.0} 
{Name="k.cont" Voltage=0.0}
}

Physics {
Temperature=300.0
Fermi
EffectiveIntrinsicDensity( OldSlotboom)

Mobility(
	DopingDep
	HighFieldSat
)

Recombination( 
	SRH( DopingDep TempDependence)  
  Band2Band
	Auger
  Avalanche ( vanOverstraeten Eparallel )
)

}

Plot {
	DopingWells
	eDensity hDensity eCurrent hCurrent
	eQuasiFermi hQuasiFermi
	Current
	Potential SpaceCharge ElectricField ElectricField/Vector
	eMobility hMobility eVelocity hVelocity
	Doping DonorConcentration AcceptorConcentration
}

* Traking additional data in the current file:
* (page 114 ug)
CurrentPlot {
ElectricField/Vector(
  Minimum(Everywhere Coordinates)
  Maximum(Everywhere Coordinates)
)
}

Math {
	Number_Of_Threads=1
	Extrapolate	* This must be ALWAYS ON for Quasistationary and transientsweeps 
	Derivatives	* considers mobility derivatives in Jacobian
	Iterations=15	* Maximum allowed number of Newton iterations (3D)
	RelErrControl	* Enables the relative error control for solution variables
	Digits=7	* relative error control value. Iterations stop if dx/x <10^-n
	Method=ILS	* Use the iterative linear solver
	NotDamped=100	* number of Newton iterations over which the RHS norm can increase
	Transient=BE	* Switches on BE transient method
	RHSFactor=1e25
	RHSMax=1e55
}

Solve {
	
	* ------------------------------------------	
	* Backward
	
	Load(FilePrefix= "../savs/init_peh")

	Transient(
		FinalTime=1
		MaxStep=0.02
		Goal {Name="a.cont" Voltage=-90}
	){
		Coupled{Poisson Electron Hole}
		Plot ( FilePrefix="../plts/back" Time=( range=(0 1) intervals=10) NoOverwrite )
	}	

}


