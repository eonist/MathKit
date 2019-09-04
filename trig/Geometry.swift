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
