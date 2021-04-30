File {
* Input Files
Grid  = "../structure/Loadable_fps.tdr"
* Output Files
Current = "../currents/alfa.plt"
Plot = "../plts/alfa.tdr"
Output  = "../logs/alfa"
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
	Auger
  Avalanche ( vanOverstraeten Eparallel )
  Band2Band
)

AlphaParticle (
  Energy=1e6
  Direction=(1,0) 
  Location=(0,5) 
	Time=1.0e-9
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
 	*HeavyIonCharge HeavyIonGeneration	
	AlphaGeneration
}

* Traking additional data in the current file:
* (page 114 ug)
CurrentPlot {
eDensity(
Integrate(Everywhere)
)
hDensity(
Integrate(Everywhere)
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
	Load(FilePrefix= "../savs/init_peh")

	Transient ( 
  	InitialTime=0.0 
  	FinalTime=40.0e-9 
  	InitialStep=0.1e-9 
  	MinStep=1e-18 
  	MaxStep=10.0e-9 
  	Increment=1.2 
  	*InitialTime=0.0 
  	*FinalTime=3.0e-13
  	*InitialStep=0.01e-13
		*MinStep=1e-18
  	*MaxStep=0.1e-13
  ) 
	{ 
  	Coupled { Poisson Electron Hole Contact} 
  	CurrentPlot
		Plot ( FilePrefix="../plts/alfa" Time= ( 0; 1e-9; 1.01e-9; 1.02e-9 ; 1.03e-9 ; 1.04e-9 ; 1.05e-9; 1.1e-9; 1.2e-9; 1.3e-9; 1.5e-9; 2e-9; 3e-9;  5e-9; 10e-9 ; 15e-9 ; 20e-9; 25e-9; 30e-9; 35e-9; 40e-9 ) NoOverwrite ) 
	}	
}


