//
//  Arrobj.swift
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

import Foundation

public class Arrobj: NSObject, NSCoding {
    // Original names
    static let kArrobjStr: String = "str"
    static let kArrobjNum: String = "num"
    static let kArrobjFlo: String = "flo"
    static let kArrobjBoo: String = "boo"
    static let kArrobjNull: String = "null"

    public var str: String?
    public var num: Int?
    public var flo: Double?
    public var boo: Bool?
    public var null: AnyObject?

    public class func model(obj: AnyObject) -> Arrobj? {
        var instance: Arrobj?
        if (obj is String) {
            instance = Arrobj.init(str: obj as! String)
        } else if (obj is Dictionary<String, AnyObject>) {
            instance = Arrobj.init(dict: obj as! Dictionary)
        }
        return instance
    }

    public convenience init?(str: String) {
        if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let object: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                self.init(dict: object as! Dictionary)
            } catch _ as NSError {
                self.init(dict: Dictionary())
            }
        } else {
            self.init(dict: Dictionary())
        }
    }

    public init?(dict: Dictionary<String, AnyObject>) {
        super.init()
        self.str = objectOrNil(forKey: Arrobj.kArrobjStr, fromDictionary:dict) as? String
        self.num = objectOrNil(forKey: Arrobj.kArrobjNum, fromDictionary:dict) as? Int
        self.flo = objectOrNil(forKey: Arrobj.kArrobjFlo, fromDictionary:dict) as? Double
        self.boo = objectOrNil(forKey: Arrobj.kArrobjBoo, fromDictionary:dict) as? Bool
        self.null = Null.model(dict[Arrobj.kArrobjNull]!)
    }

    public func dictionaryRepresentation() -> Dictionary<String, AnyObject> {
        var mutableDict: Dictionary = [String: AnyObject]()
        mutableDict[Arrobj.kArrobjStr] = self.str
        mutableDict[Arrobj.kArrobjNum] = self.num
        mutableDict[Arrobj.kArrobjFlo] = self.flo
        mutableDict[Arrobj.kArrobjBoo] = self.boo
        mutableDict[Arrobj.kArrobjNull] = self.null
        return NSDictionary.init(dictionary: mutableDict) as! Dictionary<String, AnyObject>
    }

    public func objectOrNil(forKey key: String, fromDictionary dict: Dictionary<String, AnyObject>) -> AnyObject?
    {
        if let object: AnyObject = dict[key] {
            if !(object is NSNull) {
                return object
            }
        }
        return nil
    }

    required public init(coder aDecoder: NSCoder) {
        self.str = aDecoder.decodeObjectForKey(Arrobj.kArrobjStr)! as? String
        self.num = aDecoder.decodeObjectForKey(Arrobj.kArrobjNum)! as? Int
        self.flo = aDecoder.decodeObjectForKey(Arrobj.kArrobjFlo)! as? Double
        self.boo = aDecoder.decodeObjectForKey(Arrobj.kArrobjBoo)! as? Bool
        self.null = aDecoder.decodeObjectForKey(Arrobj.kArrobjNull)!
    }

    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(str, forKey:Arrobj.kArrobjStr)
        aCoder.encodeObject(num, forKey:Arrobj.kArrobjNum)
        aCoder.encodeObject(flo, forKey:Arrobj.kArrobjFlo)
        aCoder.encodeObject(boo, forKey:Arrobj.kArrobjBoo)
        aCoder.encodeObject(null, forKey:Arrobj.kArrobjNull)
    }

    override public var description: String {
        get {
            return "\(dictionaryRepresentation())"
        }
    }
}
