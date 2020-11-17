using Autofac;
using FruitMall.Site.Domain;
using FruitMall.Site.Domain.IRepositories;
using FruitMall.Site.Services;
using System;
using System.Linq;

namespace FruitMall.Site.WebApi
{
    public class AutofacFruitMallModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterGeneric(typeof(RepositoriesBase<,>)).As(typeof(IRepositoriesBase<,>)); 

            var baseType = typeof(IDependency);
            var assemblies = AppDomain.CurrentDomain.GetAssemblies();
            builder.RegisterAssemblyTypes(assemblies)
                .Where(s => baseType.IsAssignableFrom(s) && !s.IsAbstract)
                .AsSelf()   //自身服务，用于没有接口的类
                .AsImplementedInterfaces()  //接口服务
                .PropertiesAutowired()  //属性注入
                .InstancePerLifetimeScope();    //保证生命周期基于请求

            builder.RegisterAssemblyTypes(System.Reflection.Assembly.GetExecutingAssembly()).PropertiesAutowired();
        }
    }
}
