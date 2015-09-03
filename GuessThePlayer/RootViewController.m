#import "RootViewController.h"
@interface RootViewController ()<UIAlertViewDelegate>
@property (strong,nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *labelTimer;
@property (assign,nonatomic) NSInteger secondsLeft;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *imageButtons;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSMutableArray *categoryArray;
@property (assign,nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger answers;
@property (strong, nonatomic) UIView *navigationBorder;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel;
@property (strong,nonatomic) NSDictionary *content;

@end

@implementation RootViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    // # Add right button to navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(restart)];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor]}; // set text color
    [self reloadContent];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // # Add bottom border to navigation bar
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    self.navigationBorder = [[UIView alloc] initWithFrame:CGRectMake(0,navigationBar.frame.size.height-1,navigationBar.frame.size.width, 1)];
    // Change the frame size
    [self.navigationBorder setBackgroundColor:[UIColor greenColor]];
    [self.navigationBorder setOpaque:YES];
    [self.navigationController.navigationBar addSubview:self.navigationBorder];
    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];

    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    [self.navigationBorder removeFromSuperview];

}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
        [self.navigationBorder removeFromSuperview];
        UINavigationBar *navigationBar = self.navigationController.navigationBar;
        self.navigationBorder = [[UIView alloc] initWithFrame:CGRectMake(0,navigationBar.frame.size.height-1,navigationBar.frame.size.width, 1)];
        // Change the frame size
        [self.navigationBorder setBackgroundColor:[UIColor greenColor]];
        [self.navigationBorder setOpaque:YES];
        [self.navigationController.navigationBar addSubview:self.navigationBorder];

}

-(void)initialize{
    // #Initialize variables
    self.answers = 0;
    self.secondsLeft=10;
    self.labelTimer.text=@(self.secondsLeft).stringValue;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Answer: %ld",(long)self.answers]];
    
    NSString *level = [[NSUserDefaults standardUserDefaults]objectForKey:@"Level"];
    self.labelLevel.text=level;
    {
    NSArray *cars = @[@"Alfa Romeo.png",
                       @"Aston Martin.png",
                       @"Audi R8.jpg",
                       @"Audi RS6.jpeg",
                       @"Audi RS7.jpg",
                       @"Bentley Continental.jpeg",
                       @"Bentley.png",
                       @"BMW M3.jpg",
                       @"BMW M5 F10.jpg",
                       @"Bugatti Veyron.jpg",
                       @"Bugatti.png",
                       @"Buick.png",
                       @"Cadillac.png",
                       @"Chrysler.png",
                       @"Corvette Hennessey.jpg",
                       @"Dodge Viper.jpg",
                       @"Dodge Viper.png",
                       @"Dodge.png",
                       @"Ferrari Italia.jpg",
                       @"Ferrari.png",
                       @"Fiat.png",
                       @"Ford Mustang.jpg",
                       @"Ford Mustang.png",
                       @"Honda Accord.jpg",
                       @"Honda.png",
                       @"Hyundai.png",
                       @"Lamborghini Aventador.jpg",
                       @"Lamborghini Huracan.jpeg",
                       @"Lamborghini Veneno.jpeg",
                       @"Lamborghini.png",
                       @"Lancia.png",
                       @"Landrover.png",
                       @"Lotus.png",
                       @"Maserati.png",
                       @"Mazda 6.jpg",
                       @"Mazda.png",
                       @"Mercedes Benz.png",
                       @"MG.png",
                       @"Mini.png",
                       @"Mitsubishi Lancer .jpg",
                       @"Mitsubishi Pajero .jpg",
                       @"Mitsubishi.png",
                       @"Mrcedes CLS 63.jpg",
                       @"Nissan GT-R R35.jpg",
                       @"Pagani Zonda.jpg",
                       @"Porsche Carrera .jpeg",
                       @"Porsche Panamera .jpg",
                       @"Skoda Octavia.jpg",
                       @"Volvo.png",
                       @"VW.png"                       ];
    NSArray *countries = @[@"Andorra.png",
                           @"Argentina.png",
                           @"Armenia.png",
                           @"Austria.png",
                           @"Azerbaijan.png",
                           @"Belarus.png",
                           @"Belgium.png",
                           @"Brazil.png",
                           @"Bulgaria.png",
                           @"Cameroon.png",
                           @"Canada.png",
                           @"Chili.png",
                           @"China.png",
                           @"Columbia.png",
                           @"Croatia 06-22-30-730.png",
                           @"Czech Republic.png",
                           @"Espana.png",
                           @"France.png",
                           @"Germany.png",
                           @"Hungary.png",
                           @"Italy.png",
                           @"Japan.png",
                           @"Moldova.png",
                           @"Netherland.png",
                           @"Portugal.png",
                           @"Romania.png",
                           @"Serbia.png",
                           @"Sweden.png",
                           @"Turkey.png",
                           @"Ukraine.png"];
    NSArray *soccer = @[@"Arsenal FC.ico",
                        @"Aston Villa.ico",
                        @"Athletic Bilbao.ico",
                        @"Atletico Madrid.ico",
                        @"Blackburn Rovers.ico",
                        @"Bolton Wanderers.ico",
                        @"Celta de Vigo.ico",
                        @"Chelsea FC.ico",
                        @"Deportivo Alaves.ico",
                        @"Deportivo La Coruna.ico",
                        @"Espanyol.ico",
                        @"Everton FC.ico",
                        @"FC Barcelona.ico",
                        @"Fulham FC.ico",
                        @"Getafe.ico",
                        @"Liverpool FC.ico",
                        @"Malaga CF.ico",
                        @"Manchester City.ico",
                        @"Manchester United.ico",
                        @"Newcastle United.ico",
                        @"Norwich City.ico",
                        @"Osasuna.ico",
                        @"Queens Park Rangers.ico",
                        @"Rayo Vallecano.ico",
                        @"Real Betis.ico",
                        @"Real Madrid.ico",
                        @"Real Mallorca.ico",
                        @"Real Oviedo.ico",
                        @"Real Sociedad.ico",
                        @"Real Valladolid.ico",
                        @"Real Zaragoza.ico",
                        @"Sevilla.ico",
                        @"Spain 1.ico",
                        @"Spain 2.ico",
                        @"Sporting Gijon.ico",
                        @"Stoke City.ico",
                        @"Sunderland AFC.ico",
                        @"Swansea City.ico",
                        @"Tenerife.ico",
                        @"Tottenham Hotspur.ico",
                        @"UD Las Palmas.ico",
                        @"Valencia.ico",
                        @"Villareal.ico",
                        @"West Bromwich Albion.ico",
                        @"Wigan Athletic.ico",
                        @"Wolverhampton Wanderers.ico"];
    
    self.content= [@{@"Cars" :cars, @"Country":countries , @"Soccer":soccer}mutableCopy];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) [self.navigationController popViewControllerAnimated:YES];
    else [self restart];
}


-(void)startTimer{
    if (!--self.secondsLeft>0) {
        [self.timer invalidate];
        [self saveResult];
        [[[UIAlertView alloc]initWithTitle:@"Game over" message:@"Try again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil]show];
    }
    self.labelTimer.text=@(self.secondsLeft).stringValue;
}
-(void)restart{
    [self.timer invalidate];
    [self initialize];
    [self reloadContent];
}

-(void)reloadContent{
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Answer: %ld",(long)self.answers]];
    self.secondsLeft=10;
    
    NSMutableSet *set = [[NSMutableSet alloc]init];
    NSArray *array = [self.content objectForKey:self.category];
    while (set.count<4) {
        int index=arc4random() % array.count;
        if (![set containsObject: array[index]])
        {
            [set addObject:array[index]];
        }
    }
    
    self.categoryArray= [[set allObjects]mutableCopy];
    for (int i=0; i<4; i++)
        [self.imageButtons[i] setBackgroundImage:[UIImage imageNamed:
                                             [NSString stringWithFormat:@"%@.jpg",self.categoryArray[i]]]
                                            forState:UIControlStateNormal];
    
    self.index = arc4random()%4;
    self.label.text = [[NSString stringWithFormat:@"%@",self.categoryArray[self.index]]componentsSeparatedByString:@"."][0];

}
- (IBAction)imageButtonPressed:(id)sender {
    if (self.index == [sender tag])
    {
        self.answers++;
        [self reloadContent];
    }
    else {
        [self saveResult];
        [[[UIAlertView alloc]initWithTitle:@"Game over" message:@"Try again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil]show];
        [self.timer invalidate];
    }
    
}
-(void)saveResult{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *currentValue = [userDefaults objectForKey:[NSString stringWithFormat:@"%@%@",
                                                         self.category, self.labelLevel.text]];
    if (self.answers>[currentValue integerValue]) {
        [userDefaults setObject:@(self.answers) forKey:[NSString stringWithFormat:@"%@%@",
                                    self.category, self.labelLevel.text]];
    }
}

@end
