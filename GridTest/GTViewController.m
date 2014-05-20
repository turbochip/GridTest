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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Getter for tgrid alloc/init's it here
    // now set the three required parameters.
    //set size to the size of the table bounds.
    self.tgrid.size=CGSizeMake(self.Table.bounds.size.width,self.Table.bounds.size.height);
    
    // minimum number of cards needed is 15
    self.tgrid.minimumNumberOfCells=15;
    
    // 3/2 aspect ratio  3 high to 2 wide.
    self.tgrid.cellAspectRatio=2.0/3.0;
    
    
    // ok for each cell create a subview and set the background color.
    for(int i=0;i<self.tgrid.rowCount;i++)
    {
        for(int j=0;j<self.tgrid.columnCount;j++)
        {
            // get the location of the rectangle for the cell.
            CGRect nrect=[self.tgrid frameOfCellAtRow:i inColumn:j];
            UIView *tcell=[[UIView alloc] initWithFrame:nrect];
            [self.Table addSubview:tcell];
            tcell.backgroundColor=[UIColor greenColor];
            
            // add new cell to our cell array.
            [self.Table.cell addObject:tcell];
        }
    }
    // set redraw forces a setneedsdisplay in the view.
    [self.Table setRedraw:YES];
}

- (Grid *)tgrid
{
    if(!_tgrid) _tgrid=[[Grid alloc] init];
    return _tgrid;
}

- (IBAction)redrawButton:(UIButton *)sender {
    // force redraw
    [self.Table setRedraw:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
