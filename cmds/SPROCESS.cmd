math coord.ucs
AdvancedCalibration
AdvancedModels

set lef 0
set rig 10

#VMesh
line x	location= 0.00	spacing= 15<nm>		tag=SiTop
line x	location= 0.05	spacing= 25<nm>
line x	location= 0.25	spacing= 50<nm>
line x	location= 0.50	spacing= 100<nm>
line x	location= 1.00	spacing= 250<nm>
line x	location= 5.00	spacing= 250<nm> tag=SiBot	

#HMesh
line y	location=$lef	spacing= 150<nm>	tag=SiLef
line y	location=$rig	spacing= 150<nm>	tag=SiRig

#set Simulation domain
region Silicon	xlo=SiTop	xhi=SiBot	ylo=SiLef	yhi=SiRig

#initialize the region
init	resistivity=5000 field=Phosphorus wafer.orient= {1 0 0} notch.direction= {0 -1 1}

#setup remeshing strategy
grid	set.min.normal.size= 1<nm>	set.normal.growth.ratio.2d= 1.2
pdbSet	grid	adaptive	1
pdbSet	grid	AdaptiveField	Refine.Rel.Error	0.50

#build masks.  *NOTE* masked region isn't processed
#mask	name=BCIM	left=4	right=6
mask	name=BCIM	left=0	right=10

#deposit EGO stack
deposit	oxide	type=isotropic	thickness=0.05
deposit nitride	type=isotropic	thickness=0.05

##############################
# Anode implant (P-type)
##############################
photo	mask=BCIM	thickness=1.0
implant	energy= 150<keV>	dose=1.3e12	tilt=7.00<degree>	rotation=0.00<degree>	Boron	beam.dose
strip	photoresist

################
#Initial anneal#
################
diffuse	temperature= 900<C>	time=0.1<min>

###############
#	Etching			#
###############
etch	nitride		type=anisotropic	thickness=0.05
etch	oxide		type=anisotropic	thickness=0.05	

##################
#Deposit/label Contacts#
#bu is an edge buffer
set	bu		0.1
contact name=a.cont	silicon	xlo=$bu	xhi=-$bu	ylo=4		yhi=6		box	add
contact	name=k.cont	silicon		xlo=5.0-$bu	xhi=5.0+$bu	ylo=$lef+$bu	yhi=$rig+$bu	box	add

#set loadable save after process simultion incase meshing strategy below performs poorly.
struct tdr=Loadable FullD !Gas mshcmd
