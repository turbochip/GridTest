//
//  GTGridView.m
//  GridTest
//
//  Created by Chip Cox on 5/19/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "GTGridView.h"
#import "grid.h"
@interface GTGridView ()

@end;
@implementation GTGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    int i=0;  // using I to alternate grid background color
    for(UIView *tcell in self.cell)
    {
        if(i & 1)  //do even odd thing.
            tcell.backgroundColor=[UIColor blueColor];
        i++;
    }
    [self setClipsToBounds:YES];
}

- (void) setRedraw:(BOOL)newredraw
{
    _redraw=newredraw;
    [self setNeedsDisplay];
}

- (NSMutableArray *) cell
{
    if(!_cell) _cell=[[NSMutableArray alloc] init];
    return _cell;
}

@end
