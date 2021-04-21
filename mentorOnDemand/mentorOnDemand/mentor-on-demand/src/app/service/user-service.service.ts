import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserServiceService {

  authurl = 'http://localhost:5000/api/'
  adminurl='http://localhost:1998/api/Admin'
  mentorurl='http://localhost:8966/api/'
  userurl='http://localhost:2654/api/'
  constructor(private http: HttpClient) { }

  getCourses()
  {
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.userurl+"user/getCourses",options)
  }
  getTraining(id)
  {
    let body = id
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.userurl+"user/getTraining/"+body,options)
  }
  addTraining(id:number,userId:number,userName:string)
  {
    let body = id+"/"+userId+"/"+userName;
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.userurl+"user/proposeTraining/"+body,options)
  }
  getMyTrainings(id:any)
  {
    let body = id
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.get(this.userurl+"user/getMyTrainings/"+body,options)
  }
  payForTraining(id, userId, amount)
  {
    let body = id+"/"+userId+"/"+amount
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.put(this.userurl+"user/payForTraining/"+body,options)
  }
  completeTraining(id, progress)
  {
    let body = id+"/"+progress
    let header = new HttpHeaders({ 'Content-Type': 'application/json', 'responseType':'text' })
    let options = { headers: header }
    return this.http.put(this.userurl+"userTwo/completeTraining/"+body,options)
  }
}
