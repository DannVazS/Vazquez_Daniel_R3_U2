//
//  SettingsViewController.m
//  DatosCuriososApp
//
//  Created by Dan Vaz on 17/10/25.
//
// SettingsViewController.m

#import "SettingsViewController.h"

@interface SettingsViewController () // Esta es la interfaz privada (categoría anónima)

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad]; // Ahora este 'super' es válido
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Ajustes";
    
    // Contenido temporal
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.view.bounds.size.width - 40, 40)];
    infoLabel.text = @"Menú de Ajustes";
    infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:infoLabel];
}

@end
