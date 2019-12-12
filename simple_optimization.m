% fixed parameters (not included in optimization)
const =    [8;      % axial length
            36;     % stator slots
            40.5;     % tooth surface radius
            31.5;     % radius at tooth root
            29.3;     % backiron radius
            .28;     % tooth fill percent
            .707;      % tooth tip fill percent
            .5;      % Tooth tip length
            pi/24;   % Tooth tip flare angle
            .1974;     % Slot fill-factor
            21;      % pole-pairs
            40.7;     % rotor surface radius
            42.02;     % back-iron radius, magnet side
            43.42;     % backiron radius
            .62;         % magnet fill percent         
            2;        % 1 = North-south poles, 2 = hallbach
            pi/4;       % rotor angle
            100;       % Q-axis current density
            ];

% first attempt at optimizing parameters with fmincon

% initial guess for decision variables
x0 = [.5;           % magnet fill percent
        42.02;      % rotor backiron radius
      ]; 
% bounds
ub = [.85;
        const(14)-.1;
      ];
lb = [.1;
        const(12)+.1;
        ];


% need to find a less janky way to do this
objfn = @(x) objective_fn([const(1); 
                            const(2); 
                            const(3);
                            const(4);
                            const(5);
                            const(6);
                            const(7);
                            const(8);
                            const(9);
                            const(10);
                            const(11);
                            const(12);
                            x(2);
                            const(14);
                            x(1);           
                            const(16);
                            const(17);
                            const(18);]);
                        
% Optimize for x                
options = optimoptions('fmincon', 'Display', 'iter', 'FiniteDifferenceStepSize',1e-2);
x = fmincon(objfn, x0, [], [], [], [], lb, ub, [], options)


