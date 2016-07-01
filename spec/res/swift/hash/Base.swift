//
//  Base.swift
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

import Foundation

public class Base: NSObject, NSCoding {
    // Original names
    static let kBase_id: String = "id"
    static let kBaseStr: String = "str"
    static let kBaseNum: String = "num"
    static let kBaseFlo: String = "flo"
    static let kBaseBoo: String = "boo"
    static let kBaseSpa_ce: String = "spa ce"
    static let kBaseSpecial: String = "special"
    static let kBaseArrdouble: String = "arrdouble"
    static let kBaseArrnum: String = "arrnum"
    static let kBaseArrstr: String = "arrstr"
    static let kBaseArrboo: String = "arrboo"
    static let kBaseArrnull: String = "arrnull"
    static let kBaseObj: String = "obj"
    static let kBaseArrobj: String = "arrobj"
    static let kBase_underscore: String = "_underscore"

    public var _id: String?
    public var str: String?
    public var num: Int?
    public var flo: Double?
    public var boo: Bool?
    public var spa_ce: Space?
    public var special: Special?
    public var arrdouble: [Double]?
    public var arrnum: [Int]?
    public var arrstr: [String]?
    public var arrboo: [Bool]?
    public var arrnull: [Arrnull]?
    public var obj: Obj?
    public var arrobj: [Arrobj]?
    public var _underscore: Underscore?

    public class func model(obj: AnyObject) -> Base? {
        var instance: Base?
        if (obj is String) {
            instance = Base.init(str: obj as! String)
        } else if (obj is Dictionary<String, AnyObject>) {
            instance = Base.init(dict: obj as! Dictionary)
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
        self._id = objectOrNil(forKey: Base.kBase_id, fromDictionary:dict) as? String
        self.str = objectOrNil(forKey: Base.kBaseStr, fromDictionary:dict) as? String
        self.num = objectOrNil(forKey: Base.kBaseNum, fromDictionary:dict) as? Int
        self.flo = objectOrNil(forKey: Base.kBaseFlo, fromDictionary:dict) as? Double
        self.boo = objectOrNil(forKey: Base.kBaseBoo, fromDictionary:dict) as? Bool
        self.spa_ce = Space.model(dict[Base.kBaseSpa_ce]!)
        self.special = Special.model(dict[Base.kBaseSpecial]!)
        self.arrdouble = objectOrNil(forKey: Base.kBaseArrdouble, fromDictionary:dict) as? [Double]
        self.arrnum = objectOrNil(forKey: Base.kBaseArrnum, fromDictionary:dict) as? [Int]
        self.arrstr = objectOrNil(forKey: Base.kBaseArrstr, fromDictionary:dict) as? [String]
        self.arrboo = objectOrNil(forKey: Base.kBaseArrboo, fromDictionary:dict) as? [Bool]
        if let objArrnull: [AnyObject] = dict[Base.kBaseArrnull] as? [AnyObject] {
            var listArrnull = [Arrnull]()
            for item in objArrnull {
                if item is Dictionary<String, AnyObject> {
                    if let obj = Arrnull.model(item) {
                        listArrnull.append(obj)
                    }
                }
            }
            self.arrnull = listArrnull
        }
        self.obj = Obj.model(dict[Base.kBaseObj]!)
        if let objArrobj: [AnyObject] = dict[Base.kBaseArrobj] as? [AnyObject] {
            var listArrobj = [Arrobj]()
            for item in objArrobj {
                if item is Dictionary<String, AnyObject> {
                    if let obj = Arrobj.model(item) {
                        listArrobj.append(obj)
                    }
                }
            }
            self.arrobj = listArrobj
        }
        self._underscore = Underscore.model(dict[Base.kBase_underscore]!)
    }

    public func dictionaryRepresentation() -> Dictionary<String, AnyObject> {
        var mutableDict: Dictionary = [String: AnyObject]()
        mutableDict[Base.kBase_id] = self._id
        mutableDict[Base.kBaseStr] = self.str
        mutableDict[Base.kBaseNum] = self.num
        mutableDict[Base.kBaseFlo] = self.flo
        mutableDict[Base.kBaseBoo] = self.boo
        if let dic = self.spa_ce?.dictionaryRepresentation() {
            mutableDict[Base.kBaseSpa_ce] = dic
        } else {
            mutableDict[Base.kBaseSpa_ce] = self.spa_ce
        }
        if let dic = self.special?.dictionaryRepresentation() {
            mutableDict[Base.kBaseSpecial] = dic
        } else {
            mutableDict[Base.kBaseSpecial] = self.special
        }
        mutableDict[Base.kBaseArrdouble] = self.arrdouble
        mutableDict[Base.kBaseArrnum] = self.arrnum
        mutableDict[Base.kBaseArrstr] = self.arrstr
        mutableDict[Base.kBaseArrboo] = self.arrboo
        var tempArrayArrnull = [Dictionary<String, AnyObject>]()
        for subArray in self.arrnull! {
            if let dicRepresentation: Dictionary<String, AnyObject> = subArray.dictionaryRepresentation() {
                 tempArrayArrnull.append(dicRepresentation)
            }
        }
        mutableDict[Base.kBaseArrnull] = Array.init(tempArrayArrnull)
        if let dic = self.obj?.dictionaryRepresentation() {
            mutableDict[Base.kBaseObj] = dic
        } else {
            mutableDict[Base.kBaseObj] = self.obj
        }
        var tempArrayArrobj = [Dictionary<String, AnyObject>]()
        for subArray in self.arrobj! {
            if let dicRepresentation: Dictionary<String, AnyObject> = subArray.dictionaryRepresentation() {
                 tempArrayArrobj.append(dicRepresentation)
            }
        }
        mutableDict[Base.kBaseArrobj] = Array.init(tempArrayArrobj)
        if let dic = self._underscore?.dictionaryRepresentation() {
            mutableDict[Base.kBase_underscore] = dic
        } else {
            mutableDict[Base.kBase_underscore] = self._underscore
        }
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
        self._id = aDecoder.decodeObjectForKey(Base.kBase_id)! as? String
        self.str = aDecoder.decodeObjectForKey(Base.kBaseStr)! as? String
        self.num = aDecoder.decodeObjectForKey(Base.kBaseNum)! as? Int
        self.flo = aDecoder.decodeObjectForKey(Base.kBaseFlo)! as? Double
        self.boo = aDecoder.decodeObjectForKey(Base.kBaseBoo)! as? Bool
        self.spa_ce = aDecoder.decodeObjectForKey(Base.kBaseSpa_ce)! as? Space
        self.special = aDecoder.decodeObjectForKey(Base.kBaseSpecial)! as? Special
        self.arrdouble = aDecoder.decodeObjectForKey(Base.kBaseArrdouble)! as? [Double]
        self.arrnum = aDecoder.decodeObjectForKey(Base.kBaseArrnum)! as? [Int]
        self.arrstr = aDecoder.decodeObjectForKey(Base.kBaseArrstr)! as? [String]
        self.arrboo = aDecoder.decodeObjectForKey(Base.kBaseArrboo)! as? [Bool]
        self.arrnull = aDecoder.decodeObjectForKey(Base.kBaseArrnull)! as? [Arrnull]
        self.obj = aDecoder.decodeObjectForKey(Base.kBaseObj)! as? Obj
        self.arrobj = aDecoder.decodeObjectForKey(Base.kBaseArrobj)! as? [Arrobj]
        self._underscore = aDecoder.decodeObjectForKey(Base.kBase_underscore)! as? Underscore
    }

    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_id, forKey:Base.kBase_id)
        aCoder.encodeObject(str, forKey:Base.kBaseStr)
        aCoder.encodeObject(num, forKey:Base.kBaseNum)
        aCoder.encodeObject(flo, forKey:Base.kBaseFlo)
        aCoder.encodeObject(boo, forKey:Base.kBaseBoo)
        aCoder.encodeObject(spa_ce, forKey:Base.kBaseSpa_ce)
        aCoder.encodeObject(special, forKey:Base.kBaseSpecial)
        aCoder.encodeObject(arrdouble, forKey:Base.kBaseArrdouble)
        aCoder.encodeObject(arrnum, forKey:Base.kBaseArrnum)
        aCoder.encodeObject(arrstr, forKey:Base.kBaseArrstr)
        aCoder.encodeObject(arrboo, forKey:Base.kBaseArrboo)
        aCoder.encodeObject(arrnull, forKey:Base.kBaseArrnull)
        aCoder.encodeObject(obj, forKey:Base.kBaseObj)
        aCoder.encodeObject(arrobj, forKey:Base.kBaseArrobj)
        aCoder.encodeObject(_underscore, forKey:Base.kBase_underscore)
    }

    override public var description: String {
        get {
            return "\(dictionaryRepresentation())"
        }
    }
}
