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
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:12.0];
    [self setClipsToBounds:YES];
    if(self.row+self.col & 1)
        self.backgroundColor=[UIColor blueColor];
    else
        self.backgroundColor=[UIColor greenColor];
    
    [self.backgroundColor setFill];
//        if(i & 1)  //do even odd thing.
  //          tcell.backgroundColor=[UIColor blueColor];
    
    [path setLineWidth:2];
    [path fill];
    [path stroke];
}

- (void) setRedraw:(BOOL)newredraw
{
    _redraw=newredraw;
    [self setNeedsDisplay];
}


@end
