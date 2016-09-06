//
//  ViewController.m
//  twoView
//
//  Created by Macx on 16/6/23.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scroll1;
    UIImageView *nextImage;
    UIImageView *currentImage;
    int index;
    BOOL next;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    scroll1 = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scroll1.pagingEnabled = YES ;
    scroll1.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height);
    scroll1.showsVerticalScrollIndicator = NO ;
    scroll1.showsHorizontalScrollIndicator= NO;
    scroll1.delegate = self ;
    scroll1.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    [self.view addSubview:scroll1];
    
    currentImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
    currentImage.image =[UIImage imageNamed:@"0"];
    nextImage = [[UIImageView alloc]initWithFrame:self.view.frame];
    [scroll1 addSubview:nextImage];
    [scroll1 addSubview:currentImage];
    
    
    
    index = 0 ;
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x > self.view.bounds.size.width) {
        next = YES;
        //todo 设置nextImageView
        [self setImageViewImage];

        if (scrollView.contentOffset.x > self.view.bounds.size.width*2) {
            index ++;
            index = index >11?0:index;
            //todo 设置currentImage
            [self setImageViewImage];
            scrollView.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
        }
    }
    if (scrollView.contentOffset.x < self.view.bounds.size.width) {
        next = NO ;
        [self setImageViewImage];
        if (scrollView.contentOffset.x < 0){
            index--;
            index = index < 0 ? 11 :index ;
            [self setImageViewImage];
            scrollView.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
        }
    }
}

-(void)setImageViewImage{
    currentImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",index]];

    if (next) {
        nextImage.frame = CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        if (index ==11) {
            nextImage.image =[UIImage imageNamed:@"0"];
        }else{
            nextImage.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d",index+1]];
        }
    }else{
        nextImage.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        if (index ==0) {
            nextImage.image =[UIImage imageNamed:@"11"];
        }else{
            nextImage.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d",index-1]];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
