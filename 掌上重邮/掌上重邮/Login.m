//
//  Login.m
//  掌上重邮
//
//  Created by J J on 2018/5/25.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "Login.h"
#import "ViewRoot.h"
#import "AFNetworking.h"
#define width [UIScreen mainScreen].bounds.size.width//宽
#define height [UIScreen mainScreen].bounds.size.height//高
@interface Login ()<NSURLConnectionDataDelegate>

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登陆";
    //设置导航栏标题文字大小和颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Blue.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    //透明度
    self.navigationController.navigationBar.translucent = YES;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.leftBarButtonItem = button;
    
    _imageBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Blue.jpg"]];
    _imageBlue.frame = CGRectMake(0, 0, width, height / 2);
    [self.view addSubview:_imageBlue];
    
    _loge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    _loge.frame = CGRectMake(width / 3, height / 4.5, width / 3, width / 3);
    
    [self.view addSubview:_imageBlue];
    [self.view addSubview:_loge];
    
    _textField01 = [[UITextField alloc] initWithFrame:CGRectMake(width / 4, height / 2 + 10, width / 2, 40)];
    _textField01.placeholder = @"请输入学号";
    [self setLeftViewWithTextField:_textField01 imageName:@"001.png"];
    _textField01.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField01];
    
    _textField02 = [[UITextField alloc] initWithFrame:CGRectMake(width / 4, height / 2 + 60, width / 2, 40)];
    _textField02.placeholder = @"请输入身份证后六位";
    [self setLeftViewWithTextField:_textField02 imageName:@"002.png"];
    _textField02.borderStyle = UITextBorderStyleRoundedRect;
    _textField02.secureTextEntry = YES;
    [self.view addSubview:_textField02];
    
    //按钮
    _login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _login.frame = CGRectMake(width / 4, height * 3 / 4, width / 2, 40);
    [_login setTitle:@"登陆" forState:UIControlStateNormal];
    [_login addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
    [_login setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _login.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_login];
    
}

- (void)Login
{
    [self pressLogin];
}

- (void)pressLogin
{
    //获取输入框中的用户名
    NSString *textName = _textField01.text;
    //获取输入框中的密码
    NSString *textPassword = _textField02.text;

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    NSString *path = [NSString stringWithFormat:@"https://wx.idsbllp.cn/api/verify?stuNum=%@&idNum=%@",textName,textPassword];

    [session GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功！");

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"dic = %@",responseObject);

            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"欢迎使用掌上重邮" preferredStyle:UIAlertControllerStyleAlert];

            //设置对话框按钮
            UIAlertAction *defult = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_action){
                ViewRoot *root = [[ViewRoot alloc] init];
                [self.navigationController pushViewController:root animated:YES];
            }];

            //将按钮添加到对话框
            [alertController addAction:defult];

            //显示对话框
            [self presentViewController:alertController animated:YES completion:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
        //创建显示对话框
        UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"Error!" message:@"身份不合法！" preferredStyle:UIAlertControllerStyleAlert];

        //设置对话框按钮
        UIAlertAction *back = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDefault handler:nil];

        //将按钮添加到对话框中
        [alertController1 addAction:back];

        //将对话框添加到主视图
        [self presentViewController:alertController1 animated:YES completion:nil];
    }];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://wx.idsbllp.cn/api/verify"]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    NSString *args = [NSString stringWithFormat:@"stuNum=%@&idNum=%@",textName,textPassword];
//    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"下载成功！");
////        NSDictionary *dict = [NSJSONSerialization]
//    }];
//    [sessionDataTask resume];
}

-(void)setLeftViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    UIImageView *rightView = [[UIImageView alloc] init];
    rightView.image = [UIImage imageNamed:imageName];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //使虚拟键盘回收，不再做为第一消息响应
    [_textField01 resignFirstResponder];
    [_textField02 resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
