//
//  GTViewController.m
//  GridTest
//
//  Created by Chip Cox on 5/19/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "GTViewController.h"
#import "Grid.h"
#import "GTGridView.h"

@interface GTViewController ()
@property (strong, nonatomic) Grid *tgrid;
@end

@implementation GTViewController

- (NSMutableArray *) cell
{
    if(!_cell) _cell=[[NSMutableArray alloc] init];
    return _cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self redrawGrid];
}

// just a method to avoid continually retyping these two lines.
- (void) redrawGrid
{
    [self drawGrid];
}

// method called in response to an orientation change
-(void)didRotate:(NSNotification *)notification
{
    [self redrawGrid];
}

//response to redraw button being pressed
- (IBAction)redrawButton:(UIButton *)sender {
    [self redrawGrid];
}

- (void) cleanupGrid
{
    if([[UIDevice currentDevice] isGeneratingDeviceOrientationNotifications])
    {
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    }
    for (UIView *sv in self.Table.subviews)
        [sv removeFromSuperview];
    self.cell=nil;
}
- (void) drawGrid
{
    [self cleanupGrid];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(didRotate:)
                                             name:UIDeviceOrientationDidChangeNotification
                                           object:nil];
    //Getter for tgrid alloc/init's it here
    // now set the three required parameters.
    //set size to the size of the table bounds.
    NSLog(@"self.Table.bounds=%f,%f",self.Table.bounds.size.width,self.Table.bounds.size.height);
    self.tgrid.size=CGSizeMake(self.Table.bounds.size.width,self.Table.bounds.size.height);
    
    // minimum number of cards needed is 15
    self.tgrid.minimumNumberOfCells=15;
    
    // 2/3 aspect ratio  3 high to 2 wide.
    self.tgrid.cellAspectRatio=2.0/3.0;
    

    // ok for each cell create a subview and set the background color.
    for(NSInteger i=0;i<self.tgrid.rowCount;i++)
    {
        for(NSInteger j=0;j<self.tgrid.columnCount;j++)
        {
            // get the location of the rectangle for the cell.
            CGRect nrect=[self.tgrid frameOfCellAtRow:i inColumn:j];
            GTGridView *tcell=[[GTGridView alloc] initWithFrame:nrect];
            tcell.row=i;
            tcell.col=j;
                tcell.backgroundColor=[UIColor redColor];
//            [tcell drawRect:tcell.bounds];

            [self.Table addSubview:tcell];
            
            // add new cell to our cell array.
//            [tcell setClipsToBounds:YES];
            [self.cell addObject:tcell];
            [tcell setRedraw:YES];
        }
    }
    // set redraw forces a setneedsdisplay in the view.
}

- (Grid *)tgrid
{
    if(!_tgrid) _tgrid=[[Grid alloc] init];
    return _tgrid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
