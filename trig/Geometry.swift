 import Foundation
 /**
  * - Fixme: ⚠️️ what is the difference between contraDirectional and oppositeDirectional
  * - Note: isContraDirectional is like parallel but vectors must go in opposite directions
  */
 static func isContraDirectional(_ aP1: CGPoint, _ aP2: CGPoint, _ bP1: CGPoint, _ bP2: CGPoint) -> Bool {
     let a: CGFloat = Trig.angle(aP1, aP2)
     let b: CGFloat = Trig.angle(bP1, bP2)
     return Trig.isContraDirectional(a, b)
 }
 /**
  * Asserts codirectionality
  * - Fixme: ⚠️️ describe whats different
  * - Fixme: ⚠️️ rename to isCoDir
  */
 static func isCoDirectional(_ a1: CGPoint, _ a2: CGPoint, _ b1: CGPoint, _ b2: CGPoint) -> Bool {
     let a: CGFloat = Trig.angle(a1, a2)
     let b: CGFloat = Trig.angle(b1, b2)
     return Trig.isCoDir(a, b)
 }
 /**
* rayPoint: Point, pivot: Point,p1: Point,p2: Point
* - Fixme: ⚠️️ we could use slope() here too?, just consider infinity and -infinity and NaN as results of slope
* - Important: carefull when you add points, as you need to think from bisector points and outward. (outgoing angles)
*/
static func oppositeDirectional(_ bisectorP1: CGPoint, _ bisectorP2: CGPoint, _ aP1: CGPoint, _ aP2: CGPoint, _ bP1: CGPoint, _ bP2: CGPoint) -> Bool {
 let bisectorAngle: CGFloat = Trig.angle(bisectorP1, bisectorP2)
 let angleA: CGFloat = Trig.angle(aP1, aP2)
 let angleB: CGFloat = Trig.angle(bP1, bP2)
 return Trig.isOppositeDirectional(bisectorAngle, angleA, angleB)//- Fixme: ⚠️️ we could do the asserting with slope instead of trig, just consider infinity and -infinity and NaN as results of slope
}

/**
* - Parameter: rotation must be between -PI and +PI
*/
static func safeRotatePoint(_ pivot: CGPoint, _ point: CGPoint, _ rotation: CGFloat) -> CGPoint {
 let pointAngle: CGFloat = Trig.angle(pivot, point)/*find the angle of point*/
 let distance: CGFloat = CGPointParser.distance(pivot, point)/*length of point and pivotPoint*/
 let rot: CGFloat = Trig.normalize2(pointAngle + rotation)/*sum of pointAngle and rotation, normalize this aka clamp between (-π and π)*/
 return pivot + CGPointParser.safePolar(distance, rot)/*use Point.polar*/
}
static func oppositeDirectional(_ bisector: CGLine, _ a: CGLine, _ b: CGLine) -> Bool {// :- Fixme: ⚠️️ rename to isSomeName
     return CGPointAsserter.oppositeDirectional(bisector.p1,bisector.p2,a.p1,a.p2,b.p1,b.p2)
 }
 static func isContraDirectional(_ a: CGLine, _ b: CGLine) -> Bool {
     return CGPointAsserter.isContraDirectional(a.p1,a.p2,b.p1,b.p2)
 }
 static func isCoDirectional(_ a: CGLine, _ b: CGLine) -> Bool {
     return CGPointAsserter.isCoDirectional(a.p1, a.p2, b.p1, b.p2)
 }


 /**
  * - Note: works similar to directionalAxisDifference, but returns only positive values (distance can only be positive)
  */
static func directionalAxisDistance(_ pivot: CGPoint, _ point: CGPoint, _ rotation: CGFloat) -> CGPoint {
     let leveledPoint: CGPoint = CGPointModifier.safeRotatePoint(pivot, point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
     return axisDistance(pivot, leveledPoint)
}
/**
 * - Note: same as directionalAxisDifference, but uses the NumerParser.relativeDifference() method
 */
static func relativeDirectionalAxisDifference(_ pivot: CGPoint, _ point: CGPoint, _ rotation: CGFloat) -> CGPoint {
    let leveledPoint: CGPoint = CGPointModifier.safeRotatePoint(pivot, point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
    return CGPointParser.relativeDifference(pivot, leveledPoint)/*use the x value and the Point.polar(x,axisangle) to find the p*/
}
/**
 * Returns the distance (can be positive or negative) in x and y axis
 * - Important: use the x value and the Point.polar(x,axisangle) to find the p
 * - Note: remember to rotate the axix after its been returned from this method
 * - Parameter: rotation: the angle you want to levle with
 * - Fixme: ⚠️️shouldnt the axis be found by Angle.angle(p1,p2) ?!?
 * - Fixme: ⚠️️you may not need to use rotation with pivot, the pivot may not be needed
 * - Fixme: ⚠️️rename to localDifference, another sugestion would be axisDifference or leveledDifference
 */
static func directionalAxisDifference(_ pivot: CGPoint, _ point: CGPoint, _ rotation: CGFloat) -> CGPoint {
    let leveledPoint: CGPoint = CGPointModifier.safeRotatePoint(pivot,point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
    return CGPointParser.difference(pivot, leveledPoint)/*use the x value and the Point.polar(x,axisangle) to find the p*/
}
