// FactViewController.m
//  DatosCuriososApp
//
//  Created by Dan Vaz on 17/10/25.
//
#import "FactViewController.h"
#import "SettingsViewController.h" // Se necesita para el botón de ajustes

@interface FactViewController ()

@end

@implementation FactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. Inicializar el modelo de datos
    [self inicializarDatosCuriosos];
    self.indiceActual = 0; // Inicia siempre con el primer dato de la categoría
    
    // 2. Configurar la Interfaz de Usuario
    [self configurarUI];
    
    // 3. Mostrar el primer dato
    [self actualizarDatoCurioso];
}

// Lógica de datos (Modelo)
- (void)inicializarDatosCuriosos {
    // Definimos el diccionario con todas las categorías y sus datos
    self.datos = @{
        @"Ciencia y tecnología": @[
            @"¿Sabías que un día en Venus es más largo que un año en Venus?",
            @"La luz tarda unos 8 minutos y 20 segundos en viajar del Sol a la Tierra.",
            @"Solo hay un tipo de sangre que todos los mosquitos odian.",
        ],
        @"Historia y cultura": @[
            @"El imperio romano colapsó oficialmente en 476 d.C.",
            @"Las pirámides de Giza fueron la estructura más alta hecha por el hombre durante más de 3800 años.",
            @"Un faraón egipcio una vez cubrió a sus esclavos con miel para mantener alejados a los insectos.",
        ],
        @"Naturaleza y Animales": @[
            @"El corazón de un camarón está en su cabeza.",
            @"Un caracol puede dormir hasta por 3 años.",
            @"Las huellas nasales de los perros son únicas, como las huellas dactilares humanas.",
        ]
    };
}

- (void)configurarUI {
    
    // --- Botón de Ajustes (Engranaje) ---
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]
                                       initWithImage:[UIImage systemImageNamed:@"gearshape"]
                                       style:UIBarButtonItemStylePlain
                                       target:self
                                       action:@selector(irAAjustes)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    
    // --- Etiqueta de Categoría Actual ---
    self.categoriaActualLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 30)];
    self.categoriaActualLabel.text = [NSString stringWithFormat:@"Categoría Actual: %@", self.categoriaSeleccionada];
    self.categoriaActualLabel.textAlignment = NSTextAlignmentCenter;
    self.categoriaActualLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:self.categoriaActualLabel];
    
    // --- Etiqueta de Dato Curioso ---
    self.datoCuriosoLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 250, self.view.bounds.size.width - 80, 200)];
    self.datoCuriosoLabel.textAlignment = NSTextAlignmentCenter;
    self.datoCuriosoLabel.numberOfLines = 0;
    self.datoCuriosoLabel.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:self.datoCuriosoLabel];
    
    // --- Botón "Siguiente dato curioso..." ---
    UIButton *siguienteBoton = [UIButton buttonWithType:UIButtonTypeSystem];
    siguienteBoton.frame = CGRectMake(20, self.view.bounds.size.height - 100, self.view.bounds.size.width - 40, 50);
    [siguienteBoton setTitle:@"Siguiente dato curioso..." forState:UIControlStateNormal];
    siguienteBoton.backgroundColor = [UIColor systemGray6Color];
    siguienteBoton.layer.cornerRadius = 10;
    
    // Acción para mostrar el siguiente dato
    [siguienteBoton addTarget:self
                       action:@selector(mostrarSiguienteDatoCurioso)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:siguienteBoton];
}

// Acción: Navegar a SettingsViewController
- (void)irAAjustes {
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsVC animated:YES];
}

// Método de acción principal para ciclar el dato
- (void)mostrarSiguienteDatoCurioso {
    [self actualizarDatoCurioso];
}

// Lógica de actualización y ciclado del dato (cumple el requerimiento principal)
- (void)actualizarDatoCurioso {
    
    NSArray *curiosidades = self.datos[self.categoriaSeleccionada];
    
    if (!curiosidades || curiosidades.count == 0) {
        self.datoCuriosoLabel.text = @"¡Oops! No hay datos para esta categoría.";
        return;
    }
    
    // 1. Obtener el dato curioso en el índice actual
    NSString *dato = curiosidades[self.indiceActual];
    
    // 2. Mostrar el dato
    self.datoCuriosoLabel.text = dato;
    
    // 3. Incrementar el índice
    self.indiceActual++;
    
    // 4. Si el índice llega al final de la lista, reinicia a 0 para ciclar
    if (self.indiceActual >= curiosidades.count) {
        self.indiceActual = 0;
    }
}

@end
