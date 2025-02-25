within DistrictHeating.Components;
model Building_Zone
  "With Ventilation, Heating System, and a Heat Recovery Unit"
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        ModelicaServices.ExternalReferences.loadResource(
        "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{-100,80},{-60,110}})));
  Buildings.Fluid.Sources.Outside out(redeclare package Medium =
        Buildings.Media.Air, nPorts=1)
    annotation (Placement(transformation(extent={{-78,4},{-58,24}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium = Buildings.Media.Air, m_flow_nominal=0.05)
    annotation (Placement(transformation(extent={{30,4},{50,24}})));
  Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(
    airRat=0.4,
    AWin={0,0,12,6},
    UWin=0.9,
    AWal={36,30,24,24},
    ARoo=120,
    UWal=0.25,
    URoo=0.15,
    UFlo=0.11,
    AFlo=120,
    VRoo=360,
    winFra=0.01,
    gFac=0.5,
    redeclare package Medium = Buildings.Media.Air,
    redeclare Buildings.ThermalZones.ISO13790.Data.Medium buiMas,
    surTil={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949},
    surAzi={3.1415926535898,-1.5707963267949,0,1.5707963267949},
    nPorts=1)
    annotation (Placement(transformation(extent={{168,8},{206,40}})));
  Modelica.Blocks.Sources.Constant latGai(k=0)
    annotation (Placement(transformation(extent={{126,34},{146,54}})));
  FinalAssignment.Components.Radiator radiator(ReturnWaterTemp(k=273.15 + 50),
      Rad(m_flow_nominal=0.0717, QMin_flow(displayUnit="W")))
    annotation (Placement(transformation(extent={{130,-26},{110,-10}})));
  Modelica.Blocks.Sources.CombiTimeTable SenGai(
    table=[0,5*120; 8,2*120; 18,5*120; 24,5*120],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    timeScale(displayUnit="h") = 3600)          annotation (Placement(transformation(extent={{126,62},{146,82}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Buildings.Media.Water) annotation (Placement(
        transformation(extent={{216,-36},{272,8}}),     iconTransformation(
          extent={{216,-36},{272,8}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{236,48},{274,86}}), iconTransformation(extent={{236,48},{274,
            86}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b( redeclare package Medium = Buildings.Media.Water) annotation (Placement(
        transformation(extent={{-128,-36},{-76,12}}), iconTransformation(extent
          ={{-128,-36},{-76,12}})));
equation
  connect(zonHVAC.intLatGai, latGai.y) annotation (Line(points={{165.286,
          28.5714},{154,28.5714},{154,44},{147,44}},
                                                  color={0,0,127}));
  connect(weaDat.weaBus, out.weaBus) annotation (Line(
      points={{-60,95},{-54,95},{-54,36},{-90,36},{-90,14.2},{-78,14.2}},
      color={255,204,51},
      thickness=0.5));
  connect(zonHVAC.weaBus, weaDat.weaBus) annotation (Line(
      points={{200.571,36.5714},{200.571,95},{-60,95}},
      color={255,204,51},
      thickness=0.5));
  connect(radiator.port_house, zonHVAC.heaPorAir) annotation (Line(points={{120,-10},
          {120,90},{192.429,90},{192.429,33.1429}},                                                                           color={191,0,0}));
  connect(senTem.port_b, zonHVAC.ports[1]) annotation (Line(points={{50,14},{
          162,14},{162,14.6286},{169.357,14.6286}},                                                           color={0,127,255}));
  connect(SenGai.y[1], zonHVAC.intSenGai) annotation (Line(points={{147,72},{
          156,72},{156,35.4286},{165.286,35.4286}},                                                                    color={0,0,127}));
  connect(out.ports[1], senTem.port_a)
    annotation (Line(points={{-58,14},{30,14}}, color={0,127,255}));
  connect(zonHVAC.TAir, y) annotation (Line(points={{207.357,33.1429},{230,
          33.1429},{230,67},{255,67}},
                              color={0,0,127}));
  connect(radiator.port_supply, port_a) annotation (Line(points={{130.2,-20.2},
          {218,-20.2},{218,-14},{244,-14}},color={0,127,255}));
  connect(port_b, radiator.port_return) annotation (Line(points={{-102,-12},{
          -102,-30},{104,-30},{104,-19.8},{110,-19.8}},
                                                   color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{240,120}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{240,120}})),
    experiment(
      StopTime=2678400,
      Interval=3600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Building_Zone;
