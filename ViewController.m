//
//  ViewController.m
//  DatosCuriososApp
//
//  Created by Dan Vaz on 17/10/25.
//
#import "ViewController.h"
#import "FactViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Titulo de la barra de navegacion.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Datos Curiosos";
    
    [self configurarUI];
}

- (void)configurarUI {
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]
                                       initWithImage:[UIImage systemImageNamed:@"gearshape"]
                                       style:UIBarButtonItemStylePlain
                                       target:self
                                       action:@selector(irAAjustes)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 40)];
    titleLabel.text = @"Elige una categoria";
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [self.view addSubview:titleLabel];
    
    NSArray *categorias = @[@"Ciencia y tecnologia", @"Historia y cultura", @"Naturaleza y animales"];
    
    CGFloat yPos = 180;
    CGFloat alturaBoton = 80;
    CGFloat espaciado = 20;
    
    for(int i = 0; i < categorias.count; i++) {
        UIButton *boton = [UIButton buttonWithType:UIButtonTypeSystem];
        boton.frame = CGRectMake(20, yPos + i * (alturaBoton + espaciado), self.view.bounds.size.width - 40, alturaBoton);
        
        boton.backgroundColor = [UIColor systemGray6Color];
        boton.layer.cornerRadius = 10;
        boton.titleLabel.font = [UIFont systemFontOfSize:20];
        [boton setTitle:categorias[i] forState:UIControlStateNormal];
        
        boton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        boton.titleEdgeInsets = UIEdgeInsetsMake(0, 90, 0, 0);
        
        [boton addTarget:self
                  action:@selector(seleccionarCategoria:)
        forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:boton];
    }
}

- (void)irAAjustes {
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController: settingsVC animated:YES];
}

- (void)seleccionarCategoria:(UIButton *)sender {
    NSString *categoriaSeleccionada = [sender titleForState:UIControlStateNormal];
    FactViewController *factVC = [[FactViewController alloc] init];
    
    [factVC setCategoriaSeleccionada:categoriaSeleccionada];
    
    [self.navigationController pushViewController:factVC animated:YES];
}
@end
