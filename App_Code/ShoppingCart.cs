using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    private int _modelId;
    private string _modelName;
    private int _quantity;
    private string _color;
    private double _price;
    private double _subTotal;

    public ShoppingCart()
    {
    }


    public int ModelId
    {
        get { return _modelId; }
        set { _modelId = value; }
    }
    

    public string ModelName
    {
        get { return _modelName; }
        set { _modelName = value; }
    }
    

    public int Quantity
    {
        get { return _quantity; }
        set { _quantity = value; }
    }

    public string Color
    {
        get { return _color; }
        set { _color = value; }
    }
    
    public double Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public double SubTotal
    {
        get { return _quantity * _price; }
    }
}