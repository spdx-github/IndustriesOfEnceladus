# 1.4.4
 * On SNAP:
   * Increased bay door opening angle
   * Adjusted bay door colliders
   * Adjusted bay stoppers for more reliable open-close
   * Increased cargo bay area coverage
 * Adjusted Harvester-class haul drone accuracy
 * Adjusted RAM collider for better grinder performance
# 1.4.3
 * Added mineral hold capacity readout to equipment preview
 * Fixed critical bug in accessory storage that caused them not to work properly in amorphic holds
 * Did... something? With the Pigeon? I think I reordered its cargo accessory slot
# 1.4.2
 * Adjusted Prospector KRB-500 positions
# 1.4.1
 * Added Prospector placements for the KRB-500
# 1.4.0: EVERYTHING RETURNS TO CRAB
 * Expanded version control to use .manifest file for name, version, and ID in the interest of reusability
 * Added Runasimi KRB-500
 * Added ERS-BlasTR 7200
 * Added NDSBH
 * Changed ORD name to be shorter
 * Adjusted reactor physics on Wasp
# 1.3.2
 * On Wasp:
   * Added rear thruster and adjusted firing groups to accommodate
   * Set side thruster default angle to ~90 degrees
   * Replaced computer with Obonto 600
   * Replaced default HUD with Kitsune
   * Slightly adjusted MPU colliders
   * Adjusted centre of mass to be further rearward
   * Changed reaction wheel characteristics for better performance
   * Fixed auxiliary power systems not being equipped
   * Increased threshold before strain sounds are played
   * Slightly adjusted thermal sprites
 * Added limited config for turning off custom ships and aesthetic changes
 * Added railgun sprite modification since I didn't like the default
# 1.3.1
 * Fixed cargo hold collection detection on Wasp
 * Fixed weapon visual layer
# 1.3.0: BIG STING, LITTLE GUY
 * Added Wasp-class Scout (Decommissioned)
 * Fixed DD accessories not appearing properly
 * Fixed Pigeon cargo hold area for better drone/arm behaviour
 * Fixed Gungnir right mount not equipping properly on right low-stress hardpoints
 * Increased overall chances of IoE vessels spawning in the Dealer
# 1.2.4
 * Fixed crashes with the RAM and Pigeon, finally
 * Adjusted aux slot inheritance for TNTRL series
 * Fixed DMW turret showing duplicate entries on right low-stress hardpoint
 * Fixed cargo bay description for the Oberon
 * Fixed sprite shaders on the ORD
# 1.2.3
 * Fixed hold modifier behaviour
 * Fixed Oberon slot toggles and increased its excavator close force
 * Adjusted MAD-CERF mass
 * Fixed cargo mod behaviour
# 1.2.2
 * Fixed Pelican and Pigeon N1
# 1.2.1
 * Added Rusatom-Antonoff MPP-N1
 * Adjusted MPP areas on all ships to hopefully prevent clipping issue
 * Did some other stuff??
 * Added MAD-CERF bay accessory Support
# 1.2.0: THE BIRDS ARE COMING
 * Added Pigeon Prospector
 * Adjusted MPU colliders on the Pelican
 * Fixed SPC Gungnir displaying double on high-stress left/right hardpoints
# 1.1.5
 * Fixed cargo accessory ammo/drone storage
# 1.1.4
 * Fixed SNAP cargo bay behaviour
 * Fixed RA MPU Mk2 not showing in the OCPs
 * Fixed cargo bay accessories not being available in the DD
 * Fixed DMW Cannon not having a fixed variant
 * Fixed DMW Cannon Turret position in vendor
 * Adjusted RAM firing groups
# 1.1.3
 * Fixed MPUs not showing up on a bunch of ships (wow i'm really sorry christ)
# 1.1.2
 * Fixed amorphic modules not being offered on the RAM
# 1.1.1
 * Fixed RMS-PAL not showing in ships
# 1.1.0: THE RAM
 * Added TNTRL KX37-RAM
 * Thickened sliding bay doors on CERF and Tsukuyomi
 * Changed RMS-PAL print time to be faster than the Voyager (currently aware of bugs with it)
 * Adjusted RMS Pin-C200 and NDDFD thruster exhaust
# 1.0.1
 * Bugfixes for the upgrade menu, display architecture is now much more reliable and configurable
 * Increased RMS Pin-series thruster prices
 * Added small start jolt to Pin-series
 * Adjusted hull masses on MAD-CERF, Tsukuyomi, and OCP + variants
 * Adjusted processing area of MPPs
 * Fixed RMS-PAL description and name
# 1.0.0: THE BIG ONE
 * Full reimplementation of features aimed at improved performance and better pipelining for future development
 * Major rework of Upgrades.tscn, expanded UpgradeGroup functionality to target specific ship names
 * Updated nearly every ship collider for (hopefully) better optimisation
 * Added NDDFD engine
 * Added RMS-PAL
# 0.25.2
 * Adjusted excavator collider for better handling under high G load
 * Adjusted RP-25 colliders to prevent chunk clipping
# 0.25.1
 * Fixed the 1x SO6 Fuel Rod being "default" in some ships
 * Clarified preprocessor efficiency multiplier
# 0.25.0
 * Adjusted Oberon hull colliders and cargo bay detection area for better entry detection and drone behaviour
 * Added ND-iSMB
 * Added ND-iSMB Dual Coupling
 * Added OPS-10 Capacitor Bank
 * Added Conlido freightReady Hoppers
 * Modified some backbone stuff for better inheritance
 * Fixed masses not being correctly calculated by the vendor
# 0.24.0: OBERON
 * Added UMC Oberon MLP-60
# 0.23.0: UNLIMITED POWER
 * Added Pin-M200
 * Added OPG-14 StatPlasma
 * Added MPI City-class MPDG
# 0.22.3
 * Adjusted physics elements of OCP-207-SNAP for better and more reliable behaviour
# 0.22.2
 * Fixed refund cost on Pin-150
 * Fixed new turbines not appearing on some ships
# 0.22.1
 * Adjusted multithruster sprite
 * Fixed Dual Laminar Turbine selection in equipment menu
# 0.22.0: PACMAN IS REAL
 * Added OCP-207-SNAP
 * Fixed Harvester-class Haul Drones on the Prospector series
# 0.21.0: Pulsed Induction
 * Added RMS Pin-150
 * Adjusted RA MPU mk2 to have greater range in K225
 * Adjusted K225's SSE Voyager Fabricator collider
# 0.20.0: GEMINI and SOYUZ (and another one)
 * Added Gemini dual torch
 * Added Soyuz quad torch
 * Added Thunderbarge quad torch
 * I think I did some other things but I forgot
 * OH YEAH
 * Changed the CERF blurb to properly reflect its canonical name
 * Probably fixed Harvester-class Haul Drones not showing in turret slots
# 0.19.4
 * Added more mineral hold space
 * Fixed cargo bay display
 * Stiffened cargo bay door actuators
# 0.19.3
 * Adjusted slot toggles
 * Rearranged equipment for the repair menu
# 0.19.2
 * Adjusted RA MPU Mk2 collider
 * Fixed reactor colliders clipping into the cargo bay
# 0.19.1
 * Fixed drone behaviour
 * Made it less spinny (sadly) but FBW should still work
 * Extended the reactor emissives
 * Increased width of door opening
 * Adjusted some backend string stuff
# 0.19.0: MAD-CERF
 * Added MAD-CERF (Civilian Refit)
# 0.18.1
 * Fixed drone bay tuning issue
# 0.18.0: Laminar Turbines
 * Added Laminar Turbine
 * Added Dual Laminar Turbine
# 0.17.4
 * Added Harvester-class haul drones to Tsukuyomi torpedo tubes
# 0.17.3
 * I hate inheritance so much
 * I hate inheritance so much
 * I hate inheritance so much
 * I hate inheritance so much
 * I hate inheritance so much
 * Fixed OCP-209 hardpoints
 * FIXED THE FUCKING DD
# 0.17.2
 * Fixed cargo equipment not showing on K225
# 0.17.1
 * Added Light Ultracapacitor
 * Added Thermocouple Array
 * Fixed mass values for new light components
# 0.17.0: Harvester Haulers
 * Added THI Harvester-class Haul Drones for all low-stress hardpoints
 * Changed the way drone bays get their maximum tuning values
 * Added projectile clip with 200 kg capacity, for ships without internal ammo
# 0.16.1
 * Fixed cargo baffles not displaying
 * Adjusted RA MPU Mk1 collider and effective area
 * Adjusted RA MPU Mk2 effective area
 * Fixed preprocessor ringroid processing
# 0.16.0: Deep Dish
 * Added OCP-209-DD, a variant of the OCP that extends the cargo bay and supports accessories
 * Fixed NANI Torch not displaying properly
# 0.15.2
 * Quick fix for DMW-CT not appearing in weapon slots
# 0.15.1
 * Changed OCP-209 RA MPU Mk2 collider to be more appropriately enormous
 * Adjusted OCP-209 bay area for better performance with haul drones
 * Adjusted left-right salvage arm withdraw velocity to match the OCP configuration
 * Adjusted Tsukuyomi high-stress hardpoint positions
 * Adjusted Tsukuyomi hull and excavator collider
 * Reduced automatic targeting range of DMW-CT
 * Increased rotational speed of DMW-CT
# 0.15.0
 * Added docking bay hardpoints to OCP-209
# 0.14.0
 * Added tightbeam microwave emitter
 * Added a turreted variant too
 * Fixed 1x SO6 fuel rod pricing
# 0.13.2
 * Fixed a small string formatting issue in the Tsukuyomi description
 * Added 1x SO6 fuel rod
# 0.13.1
 * Changed drone bays on Tsukuyomi to torpedo tubes with weaponry
 * There are four of them
 * Have fun
# 0.13.0: NANI?!
 * Added NANI main torch
 * Changed Tsukuyomi hardpoint slot toggles
# 0.12.6
 * I put the arms on backwards
# 0.12.5
 * Quick fix for ORD naming in the system menu
# 0.12.4
 * Adjusted reactor characteristics, boosted damage capacities, improved thermal performance
 * Fixed AR-1500 retraction into excavator
 * Fixed ORD not displaying in high-stress hardpoint, both sides
   * Likely fixed for OCP-209 as well!
 * Adjusted high-stress hardpoint position
 * Added one used configuration
 * Adjusted turret angle
# 0.12.3
 * Added combination adrenaline booster and cabin light
 * Changed large RCS menu title to properly reflect its role as an RCS system
# 0.12.2
 * Fixed Z-index issues with THI-CCs
 * Changed cargo bay accessory colliders for improved processing
# 0.12.1
 * Fixed misnamed RCS slot
 * Added keyboard toggles for slots
# 0.12.0: Tsukuyomi-class Frigate (Decommissioned)
 * Added Tsukuyomi-class Frigate to ship vendor
# 0.11.0: SSE Cothon-2200-XL
 * Added SSE Cothon-2200-XL to ship vendor
# 0.10.0: Nakamura Big MT
 * Added Nakamura Big MT to bay accessories
 * Initial implementation of Tsukuyomi-class Frigate
# 0.9.2
 * Finalised backend implementation of shared bay equipment
# 0.9.1
 * Adjusted bay accessory colliders for better chunk handling
 * Backend implementation of shared bay equipment patterns for ease of development
# 0.9.0: Mineral Preprocessor Initial Implementation
 * Added Rasamama RP-25 to bay accessories
 * Changed strings for clarity and fixed formatting issues
# 0.8.1: OCP-209 Support
 * Extended limited implementation to OCP-209 (default+ category)
 * Changed Bald Eagle hardpoints to accept all cargo containers
 * Added E-Prime Hold Rejoin for both divided and amorphic holds
 * Added THI MD-5 for divided holds
# 0.8.0
 * Added THI Mineral Tank Module to bay accessories
 * Added SSE Saddlebags for both divided and amorphic holds
 * Rebalanced both MTM and ISR capacities
 * MTM implemented with initial mineral preprocessor behaviour
# 0.7.0: Mineral Hold Kits
 * Added new ship customisation category for mineral holds
 * Added Conlido aMorphIV for divided holds
 * Added Locking Bolts for amorphic holds
# 0.6.1
 * Fixed minor collider issue in Kitsune
 * MPUs with internalStorage > 0 will now add 6x their value to amorphic holds
# 0.6.0: THI Bulker MPU
 * Added THI Bulker MPU
 * Changed MPU code to add storage to ship holds with internalStorage var
 * Extended IOE support to ND-LIS Kitsune
# 0.5.0: SSE Voyager Fabricator
 * Added SSE Voyager Fabricator to bay accessories
# 0.4.1
 * Cargo bay equipment now only shows 'default+' category in small vessels
 * RA MPU Mk2 support for EIME
# 0.4.0: Cargo Bay Accessories
 * Added new ship customisation category for cargo bay
 * Moved cargo bay baffles to new category
 * Added Conlido Internal Storage Rack
# 0.3.1
 * Fixed trade-in costs for alternate placements
 * Adjusted RA MPU Mk2 aperture size on Prospector series
# 0.3.0: Alternate Prospector Container Positions
 * Added alternate container placements on the Prospector
 * Fixed TNTRL series not being modified
# 0.2.1 - 0.2.3
 * Fixes for THI-DCC not properly working on Prospector series
# 0.2.0: RA MPU Mk2
 * Added Rusatom-Antonoff MPU Mk2
 * Supports Prospector, Cothon, TNTRL, K225
# 0.1.2
 * THI-DCC support for Prospector and K225 series
# 0.1.1
 * THI-DCC support for Cothon series
# 0.1.0: Initial release
 * Added Rusatom-Antonoff Ore Recovery Device
 * Added THI Dyna-Cargo Container
 * Initial support: TNTRL, Prospector (partial)