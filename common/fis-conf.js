// 基础配置

const APP = 'common'; // APP的名称，根据项目的实际情况来制定

//本地环境
//const lc_root = 'D:\\workplace\\'; //本地网站目录
const lc_root = 'D:\\client\\php\\pdp\\'; //本地网站目录
const lc_template = 'D:\\client\\php\\pdp\\template\\' + APP; //本地网站目录
const lc_static = 'D:\\client\\php\\pdp\\webroot\\' + APP + '\\static';  //静态文件目录
const lc_url = '/' + APP + '/static';
//const lc_url = '/';
//QA环境
//const qa_tpl_receiver = 'http://211.149.148.24:8099/prize/receiver.php';
//const qa_img_receiver = 'http://211.149.148.24:8099/prize/receiver.php';
const qa_tpl_receiver = 'http://192.168.5.3/receiver.php';
const qa_img_receiver = 'http://192.168.5.3/receiver.php';
const qa_tpldir = '/home/work/pdp/template/' + APP;
//const qa_cdn = 'http://211.149.148.24:8099/';
const qa_cdn = 'http://192.168.5.3/';
const qa_webroot = APP;
const qa_url = '/' + APP;
const qa_imgdir = '/home/work/pdp/webroot/' + APP;

////////////////////////////////////
////////////////////////////////////
// 以下配置为当前目录的基本配置
// 一般情况下不用更改
// 注意：每个类别都需要独立配置才行

// 默认基础配置
//fis.set('project.ignore', );
fis
    .match('*.js', {
      optimizer: fis.plugin('uglify-js')
    })
    .match('*.css', {
      optimizer: fis.plugin('clean-css')
    });
//  .match('*.{png,jpg,gif}', {
//    optimizer: fis.plugin('png-compressor')
//  })


// 开发环境配置
fis.media('dev')
  //TPL JSON
    .match('*.{tpl,json}', {
      deploy: fis.plugin('local-deliver', {
        to: lc_template//lc_root + APP
      })
    })
    .match('*.{woff,ttf,woff2,otf,eot,svg,png,jpg,gif,css,js}', {
      deploy: fis.plugin('local-deliver', {
        to: lc_static//lc_root + APP + '\\static'
      }),
      url: lc_url + '$0'//lc_url + APP + '/static$0'
    })
    .match('**', {
      useHash: false
    });

// 联调环境配置
fis
    .media('qa')
    .match('**', {
      useHash: true,
      domain: qa_cdn
    })
    .match('*.tpl', {
      deploy: fis.plugin('http-push', {
        receiver: qa_tpl_receiver,
        to: qa_tpldir
      }),
      useHash: false
    })
    .match('*.{woff,ttf,woff2,otf,eot,svg,png,jpg,gif,css,js}', {
      deploy: fis.plugin('http-push', {
        receiver: qa_img_receiver,
        to: qa_imgdir + '/static'
      }),
      url: APP + '/static$0'
    })
//  .match('*.js', {
//    optimizer: fis.plugin('uglify-js')
//  })
//  .match('*.css', {
//    optimizer: fis.plugin('clean-css')
//  });



